local function test()

    -- variables declaration
    -- ========================================

    local handle = Handle:new()
    local fixtureTable, name, startAddress, count, breakIndex, fixtureId, type, command
    local undoHandle, fixtureTableHandle, multiPatchAmount, undoText, message
    local fileName, exportData, path, filter, textureName, objectString, addressHandle
    local Ma3ModuleHandle, channelIndex, attributeName, displayIndex, universeNumber
    local isPercent, address, universe, executorNumber, folderName, createIfNotExist
    local basePath, pathContentType, rtChannelIndex, presetHandle, returnPhaserData
    local extract, sampleType, screenHandle, patchIndex, attributeIndex, positionTable 
    local variableHandle, varName, functionName, objectHandle, pluginHandle
    local passedObjectHandle, index, position, duration, title, text, screen, text
    local handleTarget, fixtureIndex, returnHandles, shortKeyword,progressBarHandle, value
    local handleInteger, derivedClassName, baseClassName, objectList, optionsTable
    local moduleHandle, progress, rangeTart, rangeEnd, handleString, textGuide, xPosition
    local yPosition, timedFunction, waitSeconds, iterations, TimerCleanup, returnType
    local hookId, targetObjectHandle, contextObjectHandle, baseLocationHandle, useToAddrIndex
    local returnPercent, pathTypeIndex, block, returnName, filePath, returnNamesInQuotes
    local propertyName, roleInteger, childIndex, isCueObject, tokenAndIndex, settingsTable
    local class, undo, parent, role, callback, argument, appearance, items, baseHandle, targetObject, explicitName
    local targetHandle, changeLevelEnum, destHandle, focusSearchAllowed, otherHandle, srcHandle, cell
    local searchName, searchClassName, camelCaseToFileName, lineNumber, rowId, x, y, columnId, size
    local objectToCheck, parameterName, parameterValue, nameValue, length
    local callbackName, ctx, propertyIndex, scrollType, scrollEntity, valueType, updateOpposite
    local offset, itemIdx, empty, enable, topicName, propertyValue, overrideChangeLevel, recursive
    local expectedChildren, secondsToWait, forceReInit
    local queueName, sourcePath, destinationPath, patch, startingAddress, footprint, backwards, reason
    local attribute, uiChannelIndex, phaserOnly, step, startingInternalLineNumber, charOrKeycode, shift, ctrl, alt, numlock
    local executor, buttonOrAbsX, absY, pluginName, options, changeLevelThreshold, ip, samplingPoints
    local context, objectToNotify, ipOrStation, channelName, data, colorModel, tripel1, tripel2, tripel3
    local brightness, quality, constBrightness, expectations, touchId, absX


    -- Object definition
    -- ========================================

    handle:Addr(baseLocationHandle, useToAddrIndex, isCueObject)
    handle:AddrNative(baseLocationHandle, returnNamesInQuotes)

    handle:Children()
    handle:Count()

    handle:Dump()

    handle:Export(filePath, fileName)

    handle:Get(propertyName, roleInteger)
    handle:GetChildClass()
    handle:GetClass()
    handle:GetDependencies()
    handle:GetFader(tokenAndIndex)
    handle:GetFaderText(tokenAndIndex)
    handle:GetReferences()
    handle:GetUIEditor()
    handle:GetUISettings()

    handle:HasActivePlayback()

    handle:Import(filePath, fileName)

    handle:Ptr(childIndex)

    handle:SetFader(settingsTable)

    handle:ToAddr(returnName)

    -- Not documented Object definition
    -- ========================================

    handle:Acquire(class, undo)
    handle:AddListChildren(parent, role)
    handle:AddListChildrenNames(parent, role)
    handle:AddListLuaItem(name, value, callback, argument, appearance)
    handle:AddListLuaItems(items)
    handle:AddListNumericItem(name, value, baseHandle, appearance)
    handle:AddListNumericItems(items)
    handle:AddListObjectItem(targetObject, explicitName, appearance)
    handle:AddListPropertyItem(name, value, targetHandle, appearance)
    handle:AddListPropertyItems(items)
    handle:AddListRecursiveNames(parent, role)
    handle:AddListStringItem(name, value, appearance)
    handle:AddListStringItems(items)
    handle:Append(class, undo, count)

    handle:Changed(changeLevelEnum)
    handle:ClearList()
    handle:ClearUIChildren()
    handle:CmdlineChildren()
    handle:CmdlinePtr(index)
    handle:CommandAt()
    handle:CommandCall(destHandle, focusSearchAllowed)
    handle:CommandCreateDefaults()
    handle:CommandDelete()
    handle:CommandStore()
    handle:Compare(otherHandle)
    handle:Copy(srcHandle, undo)
    handle:Create(childIndex, class, undo)
    handle:CurrentChild()

    handle:Delete(childIndex, undo)

    handle:FSExtendedModeHasDots(cell)
    handle:Find(searchName, searchClassName)
    handle:FindListItemByName(value)
    handle:FindListItemByValueStr(value)
    handle:FindParent(searchClassName)
    handle:FindRecursive(searchName, searchClassName)
    handle:FindWild(searchName)

    handle:GetAssignedObj()
    handle:GetDisplay()
    handle:GetDisplayIndex()
    handle:GetExportFileName(camelCaseToFileName)
    handle:GetLineAt(lineNumber)
    handle:GetLineCount()
    handle:GetListItemAppearance(index)
    handle:GetListItemButton(index)
    handle:GetListItemName(index)
    handle:GetListItemValueI64(index)
    handle:GetListItemValueStr(index)
    handle:GetListItemsCount()
    handle:GetListSelectedItemIndex()
    handle:GetOverlay()
    handle:GetScreen()
    handle:GetUIChild(index)
    handle:GetUIChildrenCount()
    handle:GridCellExists(cell)
    handle:GridGetBase()
    handle:GridGetCellData(cell)
    handle:GridGetCellDimensions(cell)
    handle:GridGetData()
    handle:GridGetDimensions()
    handle:GridGetParentRowId(rowId)
    handle:GridGetScrollCell()
    handle:GridGetScrollOffset()
    handle:GridGetSelectedCells()
    handle:GridGetSelection()
    handle:GridGetSettings()
    handle:GridIsCellReadOnly(cell)
    handle:GridIsCellVisible(cell)
    handle:GridMoveSelection(x, y)
    handle:GridScrollCellIntoView(cell)
    handle:GridSetColumnSize(columnId, size)
    handle:GridsGetColumnById(columnId)
    handle:GridsGetExpandHeaderCell()
    handle:GridsGetExpandHeaderCellState()
    handle:GridsGetLevelButtonWidth(cell)
    handle:GridsGetRowById(rowId)
    
    handle:HasDependencies()
    handle:HasEditSettingUI()
    handle:HasEditUI()
    handle:HasParent(objectToCheck)
    handle:HasReferences()
    handle:HookDelete(callback, argument)

    handle:Index()
    handle:InputCallFunction(functionName)
    handle:InputHasFunction(functionName)
    handle:InputRun()
    handle:InputSetAdditionalParameter(parameterName, parameterValue)
    handle:InputSetEditTitle(nameValue)
    handle:InputSetMaxLength(length)
    handle:InputSetTitle(nameValue)
    handle:InputSetValue(value)
    handle:Insert(childIndex, class, undo, count)
    handle:IsClass()
    handle:IsEmpty()
    handle:IsEnabled()
    handle:IsListItemEmpty(index)
    handle:IsListItemEnabled(index)
    handle:IsLocked()
    handle:IsValid()
    handle:IsVisible()

    handle:Load(filePath, fileName)
    
    handle:MaxCount()
    
    handle:OverlaySetCloseCallback(callbackName, ctx)

    handle:Parent()
    handle:PrepareAccess()
    handle:PropertyCount()
    handle:PropertyInfo(propertyIndex)
    handle:PropertyName(propertyIndex)
    handle:PropertyType(propertyIndex)

    handle:Remove(childIndex, undo)
    handle:RemoveListItem(name)
    handle:Resize(size)

    handle:Save(filePath, fileName)
    handle:ScrollDo(scrollType, scrollEntity, valueType, value, updateOpposite)
    handle:ScrollGetInfo(scrollType)
    handle:ScrollGetItemByOffset(scrollType, offset)
    handle:ScrollGetItemOffset(scrollType, itemIdx)
    handle:ScrollGetItemSize(scrollType, itemIdx)
    handle:ScrollIsNeeded(scrollType)
    handle:SelectListItemByIndex(index)
    handle:SelectListItemByName(nameValue)
    handle:SelectListItemByValue(value)
    handle:Set(propertyName, propertyValue, overrideChangeLevel)
    handle:SetChildren(propertyName, propertyValue, recursive)
    handle:SetChildrenRecursive(propertyName, propertyValue, recursive)
    handle:SetContextSensHelpLink(topicName)
    handle:SetEmptyListItem(index, empty)
    handle:SetEnabledListItem(index, enable)
    handle:SetListItemAppearance(index, appearance)
    handle:SetListItemName(index, name)
    handle:SetListItemValueStr(index, value)
    handle:SetPositionHint(x, y)
    handle:ShowModal(callback)

    handle:UIChildren()
    handle:UILGGetColumnAbsXLeft(index)
    handle:UILGGetColumnAbsXRight(index)
    handle:UILGGetColumnWidth(index)
    handle:UILGGetRowAbsYBottom(index)
    handle:UILGGetRowAbsYTop(index)
    handle:UILGGetRowHeight(index)

    handle:WaitChildren(expectedChildren, secondsToWait)
    handle:WaitInit(secondsToWait, forceReInit)

    -- Object free definition
    -- ========================================

    AddFixtures(fixtureTable)
    AddonVars(name)

    BuildDetails()

    CheckDMXCollision(handle, startAddress, count, breakIndex)
    CheckFIDCollision(fixtureId, count, type)
    ClassExists(name)
    CloseAllOverlays()
    CloseUndo(handle)
    Cmd(command, undoHandle)
    CmdIndirect(command, undoHandle, handleTarget)
    CmdIndirectWait(command, undoHandle, handleTarget)
    CmdObj()
    ConfigTable()
    Confirm(title, text, screen, text)
    CreateMultiPatch(fixtureTableHandle, multiPatchAmount, undoText)
    CreateUndo(undoText)
    CurrentEnvironment()
    CurrentExecPage()
    CurrentProfile()
    CurrentScreenConfig()
    CurrentUser()

    DataPool()
    DefaultDisplayPositions()
    DelVar(handle, name)
    DeskLocked()
    DeviceConfiguration()
    DirList(path, filter)
    DrawPointer(displayIndex, position, duration)
    DumpAllHooks()

    Echo(message)
    ErrEcho(message)
    ErrPrintf(message)
    Export(fileName, exportData)
    ExportCSV(fileName, exportData)
    ExportJson(fileName, exportData)

    FileExists(fileName)
    FindTexture(textureName)
    FirstDmxModeFixture(textureName)
    FixtureType()
    FromAddr(objectString, addressHandle)

    GetApiDescriptor()
    GetAttributeByUIChannel(channelIndex)
    GetAttributeCount()
    GetAttributeIndex(attributeName)
    GetButton(Ma3ModuleHandle)
    GetChannelFunction(channelIndex, attributeIndex)
    GetChannelFunctionIndex(channelIndex, attributeIndex)
    GetClassDerivationLevel(channelIndex)
    GetCurrentCue()
    GetDebugFPS()
    GetDisplayByIndex(displayIndex)
    GetDisplayCollect()
    GetDMXUniverse(universeNumber, isPercent)
    GetDMXValue(address, universe, returnPercent)
    GetExecutor(executorNumber)
    GetFocus()
    GetFocusDisplay()
    GetObjApiDescriptor()
    GetPath(folderName, createIfNotExist)
    GetPath(pathTypeIndex)
    GetPathOverrideFor(folderName, basePath, createIfNotExist)
    GetPathSeparator()
    GetPathType(objectHandle, pathContentType)
    GetPresetData(presetHandle, returnPhaserData, extract)
    GetRTChannel(rtChannelIndex)
    GetRTChannelCount()
    GetRTChannels(fixtureIndex, returnHandles)
    GetSample(sampleType)
    GetScreenContent(screenHandle)
    GetSelectedAttribute()
    GetShowFileStatus()
    GetSubfixture(fixtureIndex)
    GetSubfixtureCount()
    GetTokenName(shortKeyword)
    GetTokenNameByIndex(index)
    GetTopModal()
    GetTopOverlay()
    GetUIChannelCount()
    GetUIChannelIndex(patchIndex, attributeIndex)
    GetUIChannels(fixtureIndex, returnHandles)
    GetUIObjectAtPosition(displayIndex, positionTable)
    GetVar(variableHandle, varName)
    GlobalVars()
    
    HandleToInt(objectHandle)
    HandleToStr(objectHandle)
    HookObjectChange(functionName, objectHandle, pluginHandle, passedObjectHandle)
    HostOS()
    HostSubType()
    HostType()

    Import(fileName)
    IncProgress(progressBarHandle, value)
    IntToHandle(handleInteger)
    IsClassDerivedFrom(derivedClassName, baseClassName)
    IsObjectValid(objectHandle)

    KeyboardObj()

    MasterPool()
    MessageBox(objectHandle)
    MouseObj()
    
    NeedShowSave()

    ObjectList(objectList, optionsTable)

    Patch()
    Printf(message)
    Programmer()
    ProgrammerPart()
    Pult()

    ReleaseType()
    Root()

    SelectedFeature()
    SelectedLayout()
    SelectedSequence()
    SelectedTimecode()
    SelectedTimer()
    Selection()
    SelectionCount()
    SelectionFirst()
    SelectionNext(fixtureIndex)
    SerialNumber()
    SetBlockInput(block)
    SetLED(moduleHandle, moduleHandle)
    SetProgress(progressBarHandle, progress)
    SetProgressRange(progressBarHandle, rangeTart, rangeEnd)
    SetProgressText(progressBarHandle, text)
    SetVar(variableHandle, varName, value)
    ShowData()
    ShowSettings()
    StartProgress(title)
    StopProgress(progressBarHandle)
    StrToHandle(handleString)

    TextInput(title, textGuide, xPosition, yPosition)
    Time()
    Timer(timedFunction, waitSeconds, iterations, TimerCleanup, passedObjectHandle)
    ToAddr(objectHandle, returnType)
    TouchObj()

    Unhook(hookId)
    UnhookMultiple(functionName, targetObjectHandle, contextObjectHandle)
    UserVars()

    Version()

    -- Not documented Object free definition
    -- ========================================

    CloseMessageQueue(queueName)
    ColMeasureDeviceDarkCalibrate()
    ColMeasureDeviceDoMeasurement()
    CopyFile(sourcePath, destinationPath)
    CreateDirectoryRecursive(path)

    DevMode3d()

    FSExtendedModeHasDots(handle, cell)
    FindBestDMXPatchAddr(patch, startingAddress, footprint)
    FindBestFocus(handle)
    FindNextFocus(backwards, reason)

    GetAttributeColumnId(handle, attribute)
    GetObject(address)
    GetProgPhaser(uiChannelIndex, phaserOnly)
    GetProgPhaserValue(uiChannelIndex, step)
    GetPropertyColumnId(handle, propertyName)
    GetRemoteVideoInfo()
    GetTextScreenLine()
    GetTextScreenLineCount(startingInternalLineNumber)
    GetUIChannel(uiChannelIndex, attributeIndex)

    Keyboard(displayIndex, type, charOrKeycode, shift, ctrl, alt, numlock)

    LoadExecConfig(executor)

    Mouse(displayIndex, type, buttonOrAbsX, absY)

    OpenMessageQueue(queueName)
    OverallDeviceCertificate()

    PluginVars(pluginName)
    PopupInput(options)
    PrepareWaitObjectChange(handle, changeLevelThreshold)

    RefreshLibrary(handle)
    RemoteCommand(ip, command)

    SampleOutput(samplingPoints)
    SaveExecConfig(executor)
    SelectedDrive()
    SelectionComponentX()
    SelectionComponentY()
    SelectionComponentZ()
    SelectionNotifyBegin(context)
    SelectionNotifyEnd(context)
    SelectionNotifyObject(objectToNotify)
    SendLuaMessage(ipOrStation, channelName, data)
    SetColor(colorModel, tripel1, tripel2, tripel3, brightness, quality, constBrightness)
    SetProgPhaser(uiChannelIndex, options)
    SetProgPhaserValue(uiChannelIndex, step, options)
    SyncFS()

    TestPlaybackOutput(expectations)
    TestPlaybackOutputSteps(expectations)
    Touch(displayIndex, type, touchId, absX, absY)

    WaitModal(secondsToWait)
    WaitObjectDelete(handle, secondsToWait)
end

return test()