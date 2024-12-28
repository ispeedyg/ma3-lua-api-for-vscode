---@param fixtureTable table
---@return boolean|nil
function AddFixtures(fixtureTable)
    return true
end

---@param addonName string
function AddonVars(addonName)
end

---@return table
function BuildDetails()
    return {}
end

---@param dmxMode Handle
---@param startAddress string
---@param count integer|nil @Optional
---@param breakIndex integer @Optional
---@return boolean
function CheckDMXCollision(dmxMode, startAddress, count, breakIndex)
    return true
end

---@param fixtureId integer
---@param count integer @Optional
---@param type integer @Optional
function CheckFIDCollision(fixtureId, count, type)
end

---@param className string
---@return boolean
function ClassExists(className)
    return true
end

function CloseAllOverlays()
end

---@param undoHandle Handle
---@return boolean
function CloseUndo(undoHandle)
    return true
end

---@param command string
---@param undoHandle Handle @Optional
---@return string
function Cmd(command, undoHandle)
    return ""
end

---@param command string
---@param undoHandle Handle @Optional
---@param handleTarget Handle @Optional
function CmdIndirect(command, undoHandle, handleTarget)
    
end

---@param command string
---@param undoHandle Handle @Optional
---@param handleTarget Handle @Optional
function CmdIndirectWait(command, undoHandle, handleTarget)
    
end

---@return Handle
function CmdObj()
    return Handle:new()
end

---@return table
function ConfigTable()
    return {}
end

---@param title string
---@param text string @Optional
---@param screen integer @Optional
---@param showCancel boolean @Optional
---@return boolean
function Confirm(title, text, screen, showCancel)
    return true
end

---@param fixtureTableHandle Handle
---@param multiPatchAmount integer
---@param undoText string @Optional
---@return integer|nil
function CreateMultiPatch(fixtureTableHandle, multiPatchAmount, undoText)
    return 0
end

---@param undoText any
---@return Handle
function CreateUndo(undoText)
    return Handle:new()
end

---@return Handle
function CurrentEnvironment()
    return Handle:new()
end

---@return Handle
function CurrentExecPage()
    return Handle:new()
end

---@return Handle
function CurrentProfile()
    return Handle:new()
end

---@return Handle
function CurrentScreenConfig()
    return Handle:new()
end

---@return Handle
function CurrentUser()
    return Handle:new()
end

---@return Handle
function DataPool()
    return Handle:new()
end

---@return Handle
function DefaultDisplayPositions()
    return Handle:new()
end

---@param variableSetHandle Handle
---@param variableName string
---@return integer
function DelVar(variableSetHandle, variableName)
    return 1
end

---@return boolean
function DeskLocked()
    return true
end

---@return Handle
function DeviceConfiguration()
    return Handle:new()
end

---@param path string
---@param filter string @Optional
---@return table
function DirList(path, filter)
    return {}
end

---@param displayIndex integer
---@param position table
---@param duration integer @Optional
function DrawPointer(displayIndex, position, duration)
end

function DumpAllHooks()  
end

---@param message string
function Echo(message)
end

---@param message string
function ErrEcho(message)
end

---@param message string
function ErrPrintf(message)
    
end

---@param fileName string
---@param exportData table
---@return boolean
function Export(fileName, exportData)
    return true
end

---@param fileName string
---@param exportData table
---@return boolean
function ExportCSV(fileName, exportData)
    return true    
end

---@param fileName string
---@param exportData table
---@return boolean
function ExportJson(fileName, exportData)
    return true
end

---@param fileName string
---@return boolean
function FileExists(fileName)
    return true
end

---@param textureName string
---@return Handle|nil
function FindTexture(textureName)
    return Handle:new()
end

---@param fixtureDMXMode Handle
---@return Handle
function FirstDmxModeFixture(fixtureDMXMode)
    return Handle:new()
end

---@return Handle|nil
function FixtureType()
    return Handle:new()
end

---@param objectString string
---@param addressHandle Handle
---@return Handle
function FromAddr(objectString, addressHandle)
    return Handle:new()
end

---@return table
function GetApiDescriptor()
    return {}
end

---@param channelIndex integer
---@return Handle @Optional
function GetAttributeByUIChannel(channelIndex)
    return Handle:new()
end

---@return integer
function GetAttributeCount()
    return 0
end

---@param attributeName string
---@return integer
function GetAttributeIndex(attributeName)
    return 0
end

---@param Ma3ModuleHandle Handle
---@return table
function GetButton(Ma3ModuleHandle)
    return {}
end

---@param channelIndex integer
---@param attributeIndex integer
---@return Handle
function GetChannelFunction(channelIndex, attributeIndex)
    return Handle:new()
end

---@param channelIndex integer
---@param attributeIndex integer
---@return integer
function GetChannelFunctionIndex(channelIndex, attributeIndex)
    return 0
end

---@param className string
---@return integer
function GetClassDerivationLevel(className)
    return 0
end

---@return Handle
function GetCurrentCue()
    return Handle:new()
end

---@return integer
function GetDebugFPS()
    return 0
end

---@param displayIndex integer
---@return Handle
function GetDisplayByIndex(displayIndex)
    return Handle:new()
end

---@return Handle
function GetDisplayCollect()
    return Handle:new()
end

---@param universe integer
---@param isPercent boolean @Optional
---@return table|nil
function GetDMXUniverse(universe, isPercent)
    return {}
end

---@param address integer
---@param universe integer @Optional
---@param returnPercent boolean @Optional
---@return integer|nil
function GetDMXValue(address, universe, returnPercent)
    return 0
end

---@param executorNumber integer
---@return Handle executor
---@return Handle page
function GetExecutor(executorNumber)
    return Handle:new(), Handle:new()
end

---@return Handle
function GetFocus()
    return Handle:new()
end

---@return Handle
function GetFocusDisplay()
    return Handle:new()
end

---@return table
function GetObjApiDescriptor()
    return {}
end

---@param folderNameOrIndex string|integer
---@param createIfNotExist boolean|nil
---@return string
function GetPath(folderNameOrIndex, createIfNotExist)
    return ""
end

---@param folderNameOrIndex string|integer
---@param basePath string
---@param createIfNotExist boolean @Optional 
---@return string
function GetPathOverrideFor(folderNameOrIndex, basePath, createIfNotExist)
    return ""
end

---@return string
function GetPathSeparator()
    return ""
end

---@param objectHandle Handle
---@param pathContentType integer @Optional
---@return string
function GetPathType(objectHandle, pathContentType)
    return ""
end

---@param rtChannelIndex integer
---@return table
function GetRTChannel(rtChannelIndex)
    return {}
end

---@param presetHandle Handle
---@param returnPhaserData boolean|nil @Optional
---@param extract boolean @Optional
---@return table|nil
function GetPresetData(presetHandle, returnPhaserData, extract)
    return {}
end

---@return integer
function GetRTChannelCount()
    return 0
end

---@param fixtureIndexOfHandle integer|Handle
---@param returnHandles boolean @Optional
---@return table
function GetRTChannels(fixtureIndexOfHandle, returnHandles)
    return {}
end

---@param sampleType string
---@return number
function GetSample(sampleType)
    return 0.1
    
end

---@param screenHandle Handle
---@return Handle
function GetScreenContent(screenHandle)
    return Handle:new()
end

---@return Handle
function GetSelectedAttribute()
    return Handle:new()
end

---@return string
function GetShowFileStatus()
    return ""
end

---@param fixtureIndex integer
---@return Handle
function GetSubfixture(fixtureIndex)
    return Handle:new()    
end

---@return integer
function GetSubfixtureCount()
    return 0
end

---@param shortKeyword string
---@return string|nil
function GetTokenName(shortKeyword)
    return ""
end

---@param index string
---@return string|nil
function GetTokenNameByIndex(index)
    return ""    
end

---@return Handle|nil
function GetTopModal()
    return Handle:new()
end

---@return Handle|nil
function GetTopOverlay()
    return Handle:new()
end

---@return integer
function GetUIChannelCount()
    return 0
end

---@param patchIndex integer
---@param attributeIndex integer
---@return integer
function GetUIChannelIndex(patchIndex, attributeIndex)
    return 0
end

---@param fixtureIndexOrHandle integer|Handle
---@param returnHandles boolean @Optional
---@return table
function GetUIChannels(fixtureIndexOrHandle, returnHandles)
    return {}
end

---@param displayIndex integer
---@param positionTable table
---@return Handle|nil
function GetUIObjectAtPosition(displayIndex, positionTable)
    return Handle:new()
end

---@param variableHandle Handle
---@param varName string
---@return string|integer|number|nil
function GetVar(variableHandle, varName)
    return ""
end

---@return Handle
function GlobalVars()
    return Handle:new()
end

---@param objectHandle Handle
---@return integer
function HandleToInt(objectHandle)
    return 0
end

---@param objectHandle Handle
---@return string
function HandleToStr(objectHandle)
    return ""
end

---@param functionName function
---@param objectHandle Handle
---@param pluginHandle Handle
---@param passedObjectHandle Handle @Optional
---@return integer
function HookObjectChange(functionName, objectHandle, pluginHandle, passedObjectHandle)
    return 0
end

---@return string
function HostOS()
    return ""
end
---@return string
function HostSubType()
    return ""
end
---@return string
function HostType()
    return ""
end

---@param fileName string
---@return table
function Import(fileName)
    return {}
end

---@param progressBarHandle Handle
---@param value integer
function IncProgress(progressBarHandle, value)
end

---@param handleInteger integer
---@return Handle
function IntToHandle(handleInteger)
    return Handle:new()
end

---@param derivedClassName string
---@param baseClassName string
---@return boolean
function IsClassDerivedFrom(derivedClassName, baseClassName)
    return true
end

---@param objectHandle Handle
---@return boolean|nil
function IsObjectValid(objectHandle)
    return true
end

---@return Handle
function KeyboardObj()
    return Handle:new()
end

---@return Handle
function MasterPool()
    return Handle:new()
end

---@param objectHandle Handle
---@return table
function MessageBox(objectHandle)
    return {}
end

---@return Handle
function MouseObj()
    return Handle:new()
end

---@return boolean
function NeedShowSave()
    return true
end

---@param objectListCommand string
---@param optionsTable table
---@return table
function ObjectList(objectListCommand, optionsTable)
    return {}
end

---@return Handle
function Patch()
    return Handle:new()
end

---@param message string
function Printf(message)
end

---@return Handle
function Programmer()
    return Handle:new()
end

---@return Handle
function ProgrammerPart()
    return Handle:new()
end

---@return Handle
function Pult()
    return Handle:new()
end

---@return string
function ReleaseType()
    return ""
end

---@return Handle
function Root()
    return Handle:new()
end

---@return Handle
function SelectedFeature()
    return Handle:new()
end

---@return Handle
function SelectedLayout()
    return Handle:new()
end

---@return Handle
function SelectedSequence()
    return Handle:new()
end

---@return Handle
function SelectedTimecode()
    return Handle:new()
end

---@return Handle
function SelectedTimer()
    return Handle:new()
end

---@return Handle
function Selection()
    return Handle:new()
end

---@return integer
function SelectionCount()
    return 0
end

---@return integer patchIndex
---@return integer gridX
---@return integer gridY
---@return integer gridZ
function SelectionFirst()
    return 0, 0, 0, 0
end

---@param fixtureIndex integer
---@return integer patchIndex
---@return integer gridX
---@return integer gridY
---@return integer gridZ
function SelectionNext(fixtureIndex)
    return 0, 0, 0, 0
end

---@return string
function SerialNumber()
    return ""
end

---@param block boolean
function SetBlockInput(block)
end

---@param moduleHandle Handle
---@param ledTable table
function SetLED(moduleHandle, ledTable)
end

---@param progressBarHandle Handle
---@param progress integer
function SetProgress(progressBarHandle, progress)
end

---@param progressBarHandle Handle
---@param rangeStart integer
---@param rangeEnd integer
function SetProgressRange(progressBarHandle, rangeStart, rangeEnd)
end

---@param progressBarHandle Handle
---@param text string
function SetProgressText(progressBarHandle, text)
end

---@param variableSetHandle Handle
---@param varName string
---@return boolean
function SetVar(variableSetHandle, varName)
    return true
end

---@return Handle
function ShowData()
    return Handle:new()
end

---@return Handle
function ShowSettings()
   return Handle:new()
end

---@param title string
---@return Handle
function StartProgress(title)
    return Handle:new()
end

---@param progressBarHandle Handle
function StopProgress(progressBarHandle)
end

---@param handleString string
---@return Handle
function StrToHandle(handleString)
    return Handle:new()
end

---@param title string @Optional
---@param textGuide string @Optional
---@param xPosition string @Optional
---@param yPosition string @Optional
---@return string
function TextInput(title, textGuide, xPosition, yPosition)
    return ""
end

---@return number
function Time()
    return 0
end

---@param timedFunction function
---@param waitSeconds integer
---@param iterations integer
---@param TimerCleanup function|nil @Optional
---@param passedObjectHandle Handle @Optional
function Timer(timedFunction, waitSeconds, iterations, TimerCleanup, passedObjectHandle)
end

---@param objectHandle Handle
---@param returnType boolean @Optional
---@return string
function ToAddr(objectHandle, returnType)
    return ""
end

---@return Handle
function TouchObj()
    return Handle:new()
end

---@param hookId integer
function Unhook(hookId)
end

---@param functionName function|nil
---@param tagetObjectHandle Handle|nil
---@param contxtObjectHandle Handle|nil
---@return integer
function UnhookMultiple(functionName, tagetObjectHandle, contxtObjectHandle)
    return 0
end

---@return Handle
function UserVars()
    return Handle:new()
end

---@return string
function Version()
    return ""
end


--------- Handle ------------

---@class Handle
Handle = {}
Handle.__index = Handle

---@return Handle
function Handle:new()
    local instance = setmetatable({}, Handle)
    return instance
end

---@param baseLocationHandle Handle @Optional
---@param useToAddrIndex boolean @Optional
---@return string
function Handle:Addr(baseLocationHandle, useToAddrIndex)
    return ""
end

---@param baseLocationHandle Handle @Optional
---@param returnNamesInQuotes boolean @Optional
---@return string
function Handle:AddrNative(baseLocationHandle, returnNamesInQuotes)
    return ""
end

---@return table
function Handle:Children()
    return {}
end

---@return integer
function Handle:Count()
    return 0
end

function Handle:Dump()
end

---@param filePath string
---@param fileName string
---@return boolean
function Handle:Export(filePath, fileName)
    return true
end

---@param propertyName string
---@param roleInteger integer
---@return string
function Handle:Get(propertyName, roleInteger)
    return ""
end

---@return string
function Handle:GetChildClass()
    return ""
end

---@return string
function Handle:GetClass()
    return ""
end

---@return boolean
function Handle:HasActivePlayback()
    return true
end

---@param filePath string
---@param fileName string
---@return boolean
function Handle:Import(filePath, fileName)
    return true
end

---@param childIndex integer
---@return Handle|nil
function Handle:Ptr(childIndex)
    return Handle:new()
end

---@return string
function Handle:ToAddr()
    return ""
end