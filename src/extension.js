const vscode = require('vscode');
const path = require('path');
const fs = require('fs');

function activate(context) {
    AddApiToWorkspace(context)

    const parentDir = path.dirname(__dirname);
    const objectFreeApiPath = path.join(parentDir, 'resources', 'ma3-object-free-api.json');
    
    fs.readFile(objectFreeApiPath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading file lua.json:', err);
            return;
        }

        AddFunctionsHover(context, data)
        AddFunctionsCompletion(data)    
    });
}

function AddApiToWorkspace(context){
    const luaLibraryPath = path.join(context.extensionPath, 'resources', 'ma3_documented_api.lua');
    const config = vscode.workspace.getConfiguration('Lua');
    let currentLibraries = config.get('workspace.library') || [];

    if (!Array.isArray(currentLibraries)) {
        currentLibraries = [];
    }

    if (!currentLibraries.includes(luaLibraryPath)) {
        currentLibraries.push(luaLibraryPath);
        config.update('workspace.library', currentLibraries, vscode.ConfigurationTarget.Global);
    }
}

function AddFunctionsHover(context, data){
    
    const objectFreeJson = JSON.parse(data);
    const objectFreeKeys = Object.keys(objectFreeJson); 
        context.subscriptions.push(vscode.languages.registerHoverProvider('lua', {
            provideHover(document, position, token) {
                const range = document.getWordRangeAtPosition(position);
                if (!range) return;

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

function AddFunctionsCompletion(data){
    const objectFreeJson = JSON.parse(data);

    const snippetProvider = vscode.languages.registerCompletionItemProvider('lua', {
        provideCompletionItems() {
            return Object.entries(objectFreeJson).map(([funcName, data]) => {
                const item = new vscode.CompletionItem(funcName, vscode.CompletionItemKind.Snippet);
                item.insertText = new vscode.SnippetString(data.body[0]);
                item.kind = vscode.CompletionItemKind.Function;
                item.sortText = "0";
                item.detail = "grandMA3 API";
                
        item.label = { 
            label: funcName,
            description: "grandMa3 API",
        };
                return item;
            });
        }
    });
}

function removeApiFromWorkspace(){
    const luaLibraryPath = path.join(context.extensionPath, 'resources', 'ma3_documented_api.lua');
    const config = vscode.workspace.getConfiguration('Lua');
    let currentLibraries = config.get('workspace.library') || [];

    if (Array.isArray(currentLibraries)) {
        currentLibraries = currentLibraries.filter(path => path !== luaLibraryPath);
        config.update('workspace.library', currentLibraries, vscode.ConfigurationTarget.Global);
    }
}

function deactivate() {
    removeApiFromWorkspace()
}

module.exports = {
    activate,
    deactivate
};