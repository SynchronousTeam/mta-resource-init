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
local WINDOW_WIDTH, WINDOW_HEIGHT = guiGetScreenSize() -- Get the Size from the Game Window (global)
--- HTML Web Page Creation
local URL_PAGE = "http://mta/[init]/login/src/login.html" -- Location of the HTML File (global)
local CEF = guiCreateBrowser(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, true, false,
                             false) -- Create the Browser using the Default GUI MTA interface (global)
local BROWSER = guiGetBrowser(CEF) -- Get the Browser Object (global)
--- Functions
function deleteLoginBrowserGUI()
    if isElement(CEF) then
        destroyElement(CEF)
        showCursor(false)
    end
end -- This function removes the Browser GUI

function createLoginBrowserGUI()
    if not isElement(CEF) then
        CEF = guiCreateBrowser(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, true, false,
                               false)
        BROWSER = guiGetBrowser(CEF)
    end -- If the Browser GUI doesn't exist, create one

    addEventHandler("onClientBrowserCreated", BROWSER, function()
        loadBrowserURL(source, URL_PAGE)
        showCursor(true)
    end) -- When the Browser GUI is create load it to the Screen
end -- Create a Browser Gui and Load it to the Screen

function sendError(error)
    executeBrowserJavascript(BROWSER,
                             "document.querySelector('.error:nth-child(5)').innerHTML = '" ..
                                 error ..
                                 "'; document.querySelector('.error:nth-child(5)').style = 'display: initial; top: 90%; left:40.5%'");
end -- Get a String an use it to Show an Error Message, sending a JavaScript code to the Browser created
--- Events Created
event.load('login-browser:sendData', true)
event.add('login-browser:sendData', root, function(user, password)
    event.execute('login-backend:execute', resourceRoot, user, password) -- Triggered an Event that try to LogIn with the User and Password parameters
end, true) -- An Event called from the Browser that sends the requiered data

event.load("login-browser:show", true)
event.add("login-browser:show", root, function() createLoginBrowserGUI() end) -- An Event that shows the Login Browser GUI

event.load('login-browser:remove', true)
event.add('login-browser:remove', root, function() deleteLoginBrowserGUI() end) -- An Event that Remove the Browser GUI

event.load("browser-label:error", true)
event.add("browser-label:error", root, function(error) sendError(error) end) -- An event that get a parameter and show it into the Browser GUI like an Error
--- MTA Events
event.add("onClientResourceStart", resourceRoot,
          function() createLoginBrowserGUI() end) -- When the resource [init] starts Create the Browser GUI

