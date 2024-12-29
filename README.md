
# Ma3 lua API
This is a VS Code extension for the Grand Ma 3 Lua Api, it provide autocomplete and documentation for functions to write Grand Ma 3 plugins.

![suggestions](images/suggestions.png)

![documentation](images/documentation.png)


## How to contribute
This is an open source project, feel free to contribute by making pull requests

### What do you need:

 - [VS Code IDE](https://code.visualstudio.com/download)
 - [Node JS](https://nodejs.org/en/download)
 - Clone this repository 

### To update or complete the API documentation:

This image explain how to fill the json file that contain all documentation in the resources folder
![json filling](images/json_filling.png)

For the body part, fill the parentheses with the function parameters like:

    function(${1:fixtureId}, ${2:count}, ${3:type})

All the text part need to be converted to Markdown format, this can be done using this online tool: [Clipboard 2 Markdown](https://euangoddard.github.io/clipboard2markdown/)

After that you have to convert the markdown text to a single line string, this can be done with [json Stringlfy](https://toolsaday.com/text-tools/json-stringify)

For the code part of the example, you only have to convert to a single line string.

Additionally you have update the [ma3_documented_api.lua](resources/ma3_documented_api.lua) file in the resources folder
This file contain dummy functions with input parameters, you have to enumerate all parameters types, if they are optional, if they can be nil and the return type:

    ---@param fixtureTableHandle Handle
    ---@param multiPatchAmount integer
    ---@param undoText string @Optional
    ---@return integer|nil
    function CreateMultiPatch(fixtureTableHandle, multiPatchAmount, undoText)
        return 0
    end 

Test your modification and then, start a pull request!
