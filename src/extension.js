const vscode = require('vscode');
const path = require('path');
const fs = require('fs');

function activate(context) {
    const parentDir = path.dirname(__dirname);
    const snippetsPath = path.join(parentDir, 'snippets', 'lua.json');
    
    fs.readFile(snippetsPath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading file lua.json:', err);
            return;
        }

        const snippets = JSON.parse(data);
        const globals = Object.keys(snippets); 

        vscode.workspace.getConfiguration('Lua.diagnostics').update('globals', globals, vscode.ConfigurationTarget.Workspace);
        
        console.log('Globals update succes:', globals);
        
    
        context.subscriptions.push(vscode.languages.registerHoverProvider('lua', {
            provideHover(document, position, token) {
                const range = document.getWordRangeAtPosition(position);
                const word = document.getText(range);

                if (globals.includes(word) && snippets[word]) {
                    const description = snippets[word].description;
                    return new vscode.Hover({
                        language: 'lua',
                        value: `
\`\`\`
${description}
\`\`\`
                    `
                    });
                }

                return null;
            }
        }));

        context.subscriptions.push(hoverProvider);
    });
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
};