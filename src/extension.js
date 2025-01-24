const vscode = require('vscode');
const path = require('path');
const fs = require('fs');

function activate(context) {
    configureWorkspace(context)

    const objectFreeApiPath = getObjectFreeApiPath(context);
    
    fs.readFile(objectFreeApiPath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading object free Api file:', err);
            return;
        }

        addFunctionsHover(context, data)
        addFunctionsCompletion(context, data)    
    });

    const objectApiPath = getObjectApiPath(context);
    
    fs.readFile(objectApiPath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading object Api file:', err);
            return;
        }

        addFunctionsHover(context, data, "Handle")
        addObjectFunctionsCompletion(context, data)    
    });
}

function configureWorkspace(context){
    importDummyFunctions(context);
    addFunctionNamesToCSpell(context);
}

async function importDummyFunctions(context){
    const luaConfig = vscode.workspace.getConfiguration('Lua');

    await luaConfig.update('workspace.library', [
        context.asAbsolutePath('resources')
    ], vscode.ConfigurationTarget.Workspace);
}

async function addFunctionNamesToCSpell(context){
    const objectFreeApiPath = getObjectFreeApiPath(context);
    const objectFreeApiData = JSON.parse(fs.readFileSync(objectFreeApiPath, 'utf8'));
    const functionNames = Object.keys(objectFreeApiData);

    const cspellConfig = vscode.workspace.getConfiguration('cSpell');

    let words = cspellConfig.get('words') || [];
    if (!Array.isArray(words)) {
        words = [];
    }

    const newWords = functionNames.filter(word => !words.includes(word));
    if (newWords.length > 0) {
        words = [...words, ...newWords];
        await cspellConfig.update('words', words, vscode.ConfigurationTarget.Workspace);
    }
}

function addFunctionsHover(context, data, className){
    const jsonData = JSON.parse(data);
    var jsonKeys = Object.keys(jsonData); 
    jsonKeys = processJsonKeys(jsonKeys, className);
    
    context.subscriptions.push(vscode.languages.registerHoverProvider('lua', {
        provideHover(document, position, token) {
            const range = document.getWordRangeAtPosition(position);
            if (!range) return;

            const lineText = document.lineAt(position).text;
            const linePrefix = lineText.slice(0, position.character);

            if (linePrefix.trim().startsWith('--')) {
                return [];
            }

            const snippetKey = document.getText(range);
            const markdownContent = new vscode.MarkdownString();
            markdownContent.isTrusted = true;

            jsonDataExist = false;
            if(className && jsonData[className+":"+snippetKey]){
                jsonDataExist = true;
            } else if(jsonData[snippetKey]){
                jsonDataExist = true;
            }

            if (jsonKeys.includes(snippetKey) && jsonDataExist) {
                var snippetData = jsonData[snippetKey];
                if(className){
                    snippetData = jsonData[className+":"+snippetKey];
                }

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

function processJsonKeys(jsonKeys, className) {
    if (!className) {
        return jsonKeys;
    }

    return jsonKeys.map(key => {
        const prefix = `${className}:`;
        if (key.startsWith(prefix)) {
            return key.slice(prefix.length);
        }
        return key;
    });
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
                    description: "GrandMa 3 API",
                };
                return item;
            });

            return suggestions;
        }
    });
    context.subscriptions.push(snippetProvider);
}

function addObjectFunctionsCompletion(context, data){
    const objectJson = JSON.parse(data);

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
            
            if (!(lastColon > lastDot && lastColon > lastSpace)) {
                return [];
            }

            var suggestions = Object.entries(objectJson)
                .filter(([funcName]) => funcName.startsWith('Handle:'))
                .map(([funcName, data]) => {
                    const displayName = funcName.replace('Handle:', '');
                    const item = new vscode.CompletionItem(displayName, vscode.CompletionItemKind.Method);
                    item.insertText = new vscode.SnippetString(data.body[0]);
                    item.documentation = new vscode.MarkdownString(data.description);
                    item.kind = vscode.CompletionItemKind.Method;
                    item.sortText = "0";
                    item.label = { 
                        label: data.prefix,
                        description: "GrandMa 3 API",
                    };

                    return item;
                });

            return suggestions;
        }
    }, ':');
    
    context.subscriptions.push(snippetProvider);
}

function getObjectFreeApiPath(context){
    return normalizePath(path.join(context.extensionPath, 'resources', 'ma3_object_free_api.json'));
}

function getObjectApiPath(context){
    return normalizePath(path.join(context.extensionPath, 'resources', 'ma3_object_api.json'));
}

function normalizePath(filePath) {
    return path.resolve(filePath).toLowerCase();
}

function deactivate() {
}

module.exports = {
    activate,
    deactivate
};