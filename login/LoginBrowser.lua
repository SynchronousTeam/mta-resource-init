---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                          Name-Script: [LoginBrowser]                          |---
---|      Function-Script: Create a browser an execute functions to change it      |---
---|                  (The functions are called by the events                      |---
---|                this allows the calls from another lua files)                  |---
---|       make the connection data event to JavaScript that catch the user        |---
---|                          and password parameters                              |---
---|                                                                               |---
---|                            DEV-DATE: 21/06/2020                               |---
---|                               Client Script                                   |---
---|                                number: 001                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
local LOGIN_WINDOW_WIDTH, LOGIN_WINDOW_HEIGHT = guiGetScreenSize() -- Get the Size from the Game Window (global)
--- HTML Web Page Creation
local LOGIN_URL_PAGE = "http://mta/[init]/login/src/login.html" -- Location of the HTML File (global)
local LOGIN_CEF = guiCreateBrowser(0, 0, LOGIN_WINDOW_WIDTH,
                                   LOGIN_WINDOW_HEIGHT, true, false, false) -- Create the Browser using the Default GUI MTA interface (global)
local LOGIN_BROWSER = guiGetBrowser(LOGIN_CEF) -- Get the Browser Object (global)
--- Functions

function deleteBrowserLoginGUI()
    if isElement(LOGIN_CEF) then
        destroyElement(LOGIN_CEF)
        showCursor(false)
    end
end -- This function removes the Browser GUI

function createBrowserLoginGUI()
    if not isElement(LOGIN_CEF) then
        LOGIN_CEF = guiCreateBrowser(0, 0, LOGIN_WINDOW_WIDTH,
                                     LOGIN_WINDOW_HEIGHT, true, false, false)
        LOGIN_BROWSER = guiGetBrowser(LOGIN_CEF)
    end -- If the Browser GUI doesn't exist, create one

    addEventHandler("onClientBrowserCreated", LOGIN_BROWSER, function()
        loadBrowserURL(source, LOGIN_URL_PAGE)
        showCursor(true)
    end) -- When the Browser GUI is create load it to the Screen
end -- Create a Browser Gui and Load it to the Screen

--- Events Created
event.load('login-browser:sendData', true)
event.add('login-browser:sendData', root, function(user, password)
    event.execute('login-backend:execute', resourceRoot, user, password) -- Triggered an Event that try to LogIn with the User and Password parameters
end, true) -- An Event called from the Browser that sends the requiered data

event.load("login-browser:show", true)
event.add("login-browser:show", root, function() createBrowserLoginGUI() end) -- An Event that shows the Login Browser GUI

event.load('login-browser:remove', true)
event.add('login-browser:remove', root, function() deleteBrowserLoginGUI() end) -- An Event that Remove the Browser GUI

event.load("login-tooltip-browser:show", true)
event.add("login-tooltip-browser:show", root, function(message)
    login_tooltip_error_send = exports["[tooltip]"]:showTooltipError(message)
end) -- An event that get a parameter and show it into the Browser GUI like an Error
--- MTA Events
event.add("onClientResourceStart", resourceRoot,
          function() createBrowserLoginGUI() end) -- When the resource [init] starts Create the Browser GUI

