-- Plugin Loader --
-- version 1.1 --
-- build 136 --
-- (c) 2024 A_art Iluminacion --
-- aart.iluminacion@gmail.com --

local t_helptext={
    nofiles={
        'Why do I need a Setup plugin?\n\n'..
        'A_art plugins use many components\n'..
        'Some of these are shared by various plugins\n'..
        'This minimises the use of recourses.\n'..
        'The setup plugin keeps track of new and\n'..
        'installed components. It copies the system\n'..
        'settings from existing to new plugins and\n'..
        'will install the latest versions.',
        
        'Where is my Package folder?\n\n'..
        'The package folder is where you have unpacked\n'..
        'the zip file. Depending how you unpack, you may\n'..
        'create a folder during unpacking or you might\n'..
        'unpack the files into an existing folder. In\n'..
        'any case, there will be a folder called A_art.\n'..
        'The package folder is the folder that contains\n'..
        'that folder\n',
    
        'What is my A_art folder?\n\n'..
        'The A_art folder is where the plugins will be\n'..
        'installed. This is preferabally the root of a\n'..
        'USB drive. Installing the plugins and support\n'..
        'files on a USB drive make them portable. If the\n'..
        'A_art folder is on the root of the drive, it can\n'..
        'be detected automatically in MA consoles and in\n'..
        'Windows operating systems\n',
    
        'How can I install several A_art plugins?\n\n'..
        'All A_art plugins use the same setup plugin, so\n'..
        'you just need to import the setup plugin ones.\n'..
        'To use the plugins together you must use the\n'..
        'same A_art folder on the USB drive for all A_art\n'..
        'plugins. The setup plugin will make all plugins\n'..
        'work together with the same support files and\n'..
        'other recources\n',
    },
    restart={
        'Loader restart needed\n\n'..
        'Your new pluging includes a new version of\n'..
        'plugins loader. The old loader has been replaced\n'..
        'by the new version. In order to run the new version\n'..
        'and install your plugins or updates, you must restar\n'..
        'the A_art Loader'
    },
    loaded={
        'Plugins succesfully installed\n\n'..
        'The plugins from the USB drive are succesfully installed.\n'..
        'The loader has imported one or more macros for each\n'..
        'plugin that was found on the USB drive.\n'..
        'Use these macros to confugure or run the plugins.\n'..
        'Remember that you allways must have the USB drive connected.'
    },
    badloader={
        'Corrupted loader plugin\n\n'..
        'The USB drive contains an invalid version of the loader\n'..
        'plugin. Please download and extract the plugin files\n'..
        'according to the install guide from the manuals folder\n'..
        'If the problem consits, contact aart.iluminacion@gmail.com'
    }
}
local t_msgs={
    nofun={'Fatal problem',
        'Function A_art.%s() not found.\n'..
        'Please contact aart.iluminacion@gmail.com.\n'},
    nodrive={'USB drive not found',
        'No valid USB drive found.\n'..
        'Please connect the A_art USB drive.\n'},
    nofiles={'Files not found',
        'Necesarry files are not found.\n'..
        'Please connect the USB drive.\n'},
    restart={'Restart Needed',
        'Loader plugin is updated\n'..
        'Please launch loader again.'},
    loaded={'Load succesfull',
        '%s plugins have been succesfully\n'..
        'loaded into the show file'},
    badloader={'Invalid loader',
        'The loader plugin on the USB is not valid\n'..
        'Please download the valid files again'},
}
local s={
    catalog='%s/A_art/Index/Catalog.xml',
    index='%s/A_art/Index/%s.xml',
    plugin='%s/A_art/Plugins/%s.lua',
    loader='%s/grandMA3/gma3_library/datapools/plugins/A_art Loader.xml',
    version=' Version="(.-)"',
    build='-- build (.-) --',
    highlow=' Version=".-%..-%.(.-)%.(.-)"',
}
local o_handler=select(3, ...)
local o_component=select(4,...)
local SF=string.format
local i_MAdrive=0
A_art=A_art or {}
A_art.CallBack=A_art.CallBack or {}
A_art.Component=function() return o_component end
o_handler.Click = function(o_caller)
    local s_callback=A_art.CallBack[o_caller.Name]
    if s_callback then
        A_art[s_callback](o_caller)
    else
        A_art.Caller[A_art.CallLevel] = o_caller
    end
end
local f_showhelp=function(s_msgid)
    local t_help=t_helptext[s_msgid]
    if not t_help then
        MessageBox({
            title='Oops',
            message='No help found',
            commands={name='Ok', value=0}})
        return
    end
    local i_current=1
    repeat
        local t_res=MessageBox({
            title='Help',
            message=t_help[i_current],
            commands={
                {name='Previous',value=-1},
                {name='Ok',value=0},
                {name='Next',value=1}
            }
        })
        if not t_res then return end
        if not t_res.success then return end
        if t_res.result==0 then return end
        i_current=i_current+t_res.result
        if i_current<1 then i_current=#t_help end
        if i_current>#t_help then i_current=1 end
    until false
end
local f_msg=function(s_msgid,b_err,s_msgdata)
    local t_msg=t_msgs[s_msgid]
    if not t_msg then error('unknown message') end
    repeat
        local t_ret=MessageBox({
            title=t_msg[1],
            message=SF(t_msg[2],s_msgdata),
            commands={
                {name="Ok",value=1},
                {name="Help",value=2},
                {name="Cancel",value=0}}
        })
        if not t_ret then error('loader aborted by user') end
        if t_ret.result==0 then error('loader aborted by user') end
        if t_ret.result==1 then
            if b_err then error(t_msg[1]) else return end
        end
        if t_ret.result==2 then f_showhelp(s_msgid) end
    until false
end
A_art.GetDrive=function()
    local o_drives=FromAddr('Temp.DriveCollect'):Children()
    if not(o_drives) then return end
    for _,o_drive in ipairs(o_drives) do
        if o_drive.DriveType=='Removeable' then
            A_art.Drive=o_drive.Path
            if (A_art.Drive:sub(-1)=="/") or (A_art.Drive:sub(-1)=="\\") then
                A_art.Drive=A_art.Drive:sub(1,-2)
            end
            A_art.DriveNr=o_drive.NO
            local a_test=io.open(SF(s.loader,A_art.Drive))
            if a_test then
                a_test:close()
                return
            end
    end end
    f_msg('nodrive',true)
end
A_art.Load=function(s_file,s_fun)
    local f_loadfile=function(s_filename)
        if not A_art.Drive then A_art.GetDrive() end
        if A_art.Backup then A_art.Backup(s_filename) end
        local a_file=loadfile(SF(s.plugin,A_art.Drive,s_filename))
        if not a_file then f_msg('nofiles',true) error('stop') end
        return a_file()
    end
    if (not A_art.Backup) and (A_art[s_fun]) then return end
    local f_init=f_loadfile(s_file)
    if f_init then f_init() else f_msg('nofiles',true,s_file) end
end
A_art.Run=function(s_file,s_fun,t_arg)
    if not A_art.Drive then A_art.GetDrive() end
    if A_art.Backup then A_art.Backup(s_file) end
    if (not A_art[s_fun]) or (A_art.Backup) then A_art.Load(s_file,s_fun) end
    if (not A_art[s_fun]) then f_msg('nofun',true,s_fun) end
    A_art[s_fun](o_component,t_arg)
end

return function()
    local f_loadplugin
    f_loadplugin=function(s_plugin,b_depend)
        local a_file=io.open(SF(s.index,A_art.Drive,s_plugin))
        if not a_file then
            if b_depend then f_msg('nofiles',true) return end
            ErrPrintf(s_plugin..' not found') return 0
        end
        local s_file=a_file:read('a')
        a_file:close()
        for s_luafile in s_file:gmatch('Plugin Name="(.-)"') do
            a_file=io.open(SF(s.plugin,A_art.Drive,s_luafile))
            if not a_file then error(SF('Plugin %s not found',s_luafile)) end
            a_file:close()
        end
        for s_macro in s_file:gmatch('<Macro (.-)/>') do
            s_macro=s_macro:match('Name="(.-)"')
            local o_macro=ObjectList(SF('Macro "%s"',s_macro))[1]
            if not o_macro then
                Cmd('Store Macro "%s"',s_macro)
                o_macro=ObjectList(SF('Macro "%s"',s_macro))[1]
            end
            local i_macro=o_macro.NO
            local s_ok
            if i_MAdrive>1 then
                s_ok=Cmd('Import Macro Library "%s"'..
                ' At Macro %d If Drive %d /o',s_macro,i_macro,i_MAdrive)
            else
                for i_drive=2,10 do
                    s_ok=Cmd('Import Macro Library "%s"'..
                    ' At Macro %d If Drive %d /o',s_macro,i_macro,i_drive)
                    if s_ok=='OK' then i_MAdrive=i_drive break end
                end
            end
            if s_ok~='OK' then
                f_msg('nofiles',true)
                return 0
            end
        end
        local i_success=1
        for s_dependency in s_file:gmatch('<Dependency Name="(.-)"') do
            local i_load=f_loadplugin(s_dependency,true)
            if i_load==nil then return end
            if i_success~=0 then i_success=i_load end
        end
        if i_success==1 then Printf(s_plugin..' loaded') end
        return i_success
    end
    A_art.GetDrive()
    local o_loader=ObjectList('Plugin "A_art Loader"')[1][1]
    local s_old=o_loader.FILECONTENT
    local i_old=tonumber(s_old:match(s.build))
    local a_file=io.open(SF(s.loader,A_art.Drive),'rb')
    if not a_file then f_msg('nofiles',true) return end
    local s_new=a_file:read('a')
    local s_high,s_low=s_new:match(s.highlow)
    if (not s_high) or (not s_low) then f_msg('badloader',true) end
    local i_new=tonumber(s_high)*256+tonumber(s_low)
    if i_new>i_old then
        local i_loader=tonumber(o_loader.NO)
        local s_ok=''
        for i_drive=4,1,-1 do
            s_ok=Cmd('Import Plugin Library "A_art Loader"'..
                ' At Plugin %d If Drive %d /o',i_loader,i_drive)
            if s_ok=='OK' then break end
        end
        if s_ok~='OK' then f_msg('nofiles',true) return end
        f_msg('restart')
        return
    end
    a_file=io.open(SF(s.catalog,A_art.Drive),'rb')
    if not a_file then f_msg('nofiles',true) return end
    local s_cat=a_file:read('a')
    a_file:close()
    local i_cnt=0
    for s_plugin in s_cat:gmatch('<Plugin Name="(.-)"') do
        i_cnt=i_cnt+f_loadplugin(s_plugin)
    end
    if i_cnt==0 then f_msg('nofiles',true)
    else f_msg('loaded',false,tostring(i_cnt))
    end
end