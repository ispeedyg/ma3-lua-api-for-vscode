const vscode = require('vscode');
const path = require('path');
const fs = require('fs');

function activate(context) {
    addApiToWorkspace(context)

    const objectFreeApiPath = getObjectFreeApiPath(context);
    
    fs.readFile(objectFreeApiPath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading file lua.json:', err);
            return;
        }

        addFunctionsHover(context, data)
        addFunctionsCompletion(context, data)    
    });
}

function addApiToWorkspace(context){
    const luaConfig = vscode.workspace.getConfiguration('Lua');

    const objectFreeApiPath = getObjectFreeApiPath(context);
    const objectFreeApiData = JSON.parse(fs.readFileSync(objectFreeApiPath, 'utf8'));
    const functionNames = Object.keys(objectFreeApiData);

    addApiToGlobal(luaConfig, functionNames);

    importDummyFunctions(context, luaConfig);
}

function addApiToGlobal(luaConfig, functionNames){
    const globalTypes = ['Handle'];

    let currentGlobals = luaConfig.get('diagnostics.globals') || {};
    if (typeof currentGlobals !== 'object') {
        currentGlobals = {};
    }
    
    const updatedGlobals = [...new Set([...currentGlobals, ...globalTypes, ...functionNames])];

    luaConfig.update('diagnostics.globals', updatedGlobals, vscode.ConfigurationTarget.Workspace);
}

function importDummyFunctions(context, luaConfig){
    const luaLibraryPath = getDummyFunctionLibraryPath(context);
    let currentLibraries = luaConfig.get('workspace.library') || [];

    if (!Array.isArray(currentLibraries)) {
        currentLibraries = [];
    }

    if (!currentLibraries.includes(luaLibraryPath)) {
        currentLibraries.push(luaLibraryPath);
        luaConfig.update('workspace.library', currentLibraries, vscode.ConfigurationTarget.Global);
    }
}

function addFunctionsHover(context, data){
    
    const objectFreeJson = JSON.parse(data);
    const objectFreeKeys = Object.keys(objectFreeJson); 
        context.subscriptions.push(vscode.languages.registerHoverProvider('lua', {
            provideHover(document, position, token) {
                const range = document.getWordRangeAtPosition(position);
                if (!range) return;

                const lineText = document.lineAt(position).text;
                const linePrefix = lineText.slice(0, position.character);
    
                if (linePrefix.trim().startsWith('--')) {
                    return [];
                }
    
                const cleanPrefix = linePrefix.trim();
                
                const lastColon = cleanPrefix.lastIndexOf(':');
                const lastDot = cleanPrefix.lastIndexOf('.');
                const lastSpace = cleanPrefix.lastIndexOf(' ');
                
                if (lastColon > lastDot && lastColon > lastSpace) {
                    return [];
                }

                const snippetKey = document.getText(range);
                
                const markdownContent = new vscode.MarkdownString();
                markdownContent.isTrusted = true;

                if (objectFreeKeys.includes(snippetKey) && objectFreeJson[snippetKey]) {
                    const snippetData = objectFreeJson[snippetKey];
                    const cleanedPrefix = snippetData.prefix.replace(/\(.*?\)/g, '');

                     markdownContent.appendMarkdown(`# ${cleanedPrefix}\n\n`);
                    
                    
                    markdownContent.appendMarkdown(`${snippetData.description}\n\n`);

                    if (snippetData.examples) {
                        const examples = snippetData.examples;
                        const examplesCount = Object.keys(examples).length;

                        for (const key in examples) {
                            const example = examples[key];
                            if (examplesCount > 1) {
                                markdownContent.appendMarkdown(`\n\nExample ${key}\n-------\n\n`);
                            } else {
                                markdownContent.appendMarkdown(`\n\nExample\n-------\n\n`);
                            }
                            markdownContent.appendMarkdown(example.description);
                            markdownContent.appendCodeblock(example.code, 'lua');
                            markdownContent.appendMarkdown(`\n\n${example.suffix}`);
                        }
                    }

                    markdownContent.appendMarkdown(`${snippetData.suffix}\n\n`);
                    return new vscode.Hover(markdownContent);
                }

                return null;
            }
        }));
}

function addFunctionsCompletion(context, data){
    const objectFreeJson = JSON.parse(data);

    const snippetProvider = vscode.languages.registerCompletionItemProvider('lua', {
        provideCompletionItems(document, position) {
            const lineText = document.lineAt(position).text;
            const linePrefix = lineText.slice(0, position.character);

            if (linePrefix.trim().startsWith('--')) {
                return [];
            }

            const cleanPrefix = linePrefix.trim();
            
            const lastColon = cleanPrefix.lastIndexOf(':');
            const lastDot = cleanPrefix.lastIndexOf('.');
            const lastSpace = cleanPrefix.lastIndexOf(' ');
            
            if (lastColon > lastDot && lastColon > lastSpace) {
                return [];
            }

            var suggestions = Object.entries(objectFreeJson).map(([funcName, data]) => {
                const item = new vscode.CompletionItem(funcName, vscode.CompletionItemKind.Snippet);
                item.insertText = new vscode.SnippetString(data.body[0]);
                item.kind = vscode.CompletionItemKind.Function;
                item.sortText = "0";
                item.label = { 
                    label: data.prefix,
                    description: "GrandMa3 API",
                };
                return item;
            });

            return suggestions;
        }
    });
    context.subscriptions.push(snippetProvider);
}

function removeApiFromWorkspace(){
    const luaLibraryPath = getDummyFunctionLibraryPath(context);
    const config = vscode.workspace.getConfiguration('Lua');
    let currentLibraries = config.get('workspace.library') || [];

    if (Array.isArray(currentLibraries)) {
        currentLibraries = currentLibraries.filter(path => path !== luaLibraryPath);
        config.update('workspace.library', currentLibraries, vscode.ConfigurationTarget.Global);
    }
}

function getObjectFreeApiPath(context){
    return normalizePath(path.join(context.extensionPath, 'resources', 'ma3_object_free_api.json'));
}

function getDummyFunctionLibraryPath(context){
    return normalizePath(path.join(context.extensionPath, 'resources', 'ma3_dummy_api.lua'));
}

function normalizePath(filePath) {
    return path.resolve(filePath).toLowerCase();
}

function deactivate() {
    removeApiFromWorkspace()
}

module.exports = {
    activate,
    deactivate
};