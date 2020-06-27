---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                          Name-Script: [BaseBrowser]                           |---
---|      Function-Script: Create a browser an execute functions to change it      |---
---|                  (The functions are called by the events                      |---
---|                this allows the calls from another lua files)                  |---
---|       make the connection data event to JavaScript that catch the user        |---
---|                          and password parameters                              |---
---|                                                                               |---
---|                            DEV-DATE: 26/06/2020                               |---
---|                               Client Script                                   |---
---|                                number: 001                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--FIXME: Misterious Calling Browser - First and Dangerous Issue Pixxa

--- Server Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
local WINDOW_WIDTH, WINDOW_HEIGHT = guiGetScreenSize() -- Get the Size from the Game Window (global)
--- HTML Web Page Creation
URL_PAGE = "http://mta/[init]/base/html/base.html" -- Location of the HTML File (global)
local CEF = guiCreateBrowser(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, true, false,
                             false) -- Create the Browser using the Default GUI MTA interface (global)
local BROWSER = guiGetBrowser(CEF) -- Get the Browser Object (global)
--- Functions
function deleteBrowserGUI()
    if isElement(CEF) then
        destroyElement(CEF)
        showCursor(false)
    end
end -- This function removes the Browser GUI

function createBrowserGUI()
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
event.load("base-browser:show", true)
event.add("base-browser:show", root, function() createBrowserGUI() end) -- An Event that shows the Base Browser GUI

event.load('base-browser:remove', true)
event.add('base-browser:remove', root, function() deleteBrowserGUI() end) -- An Event that Remove the Browser GUI

event.load("base-browser-label:error", true)
event.add("base-browser-label:error", root, function(error) sendError(error) end) -- An event that get a parameter and show it into the Browser GUI like an Error

