---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                        Name-Script: [RegisterBrowser]                         |---
---|      Function-Script: Create a browser an execute functions to change it      |---
---|                  (The functions are called by the events                      |---
---|                this allows the calls from another lua files)                  |---
---|       make the connection data event to JavaScript that catch the user        |---
---|                          and password parameters                              |---
---|                                                                               |---
---|                            DEV-DATE: 02/07/2020                               |---
---|                               Client Script                                   |---
---|                                number: 001                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
loadstring(exports.dgs:dgsImportFunction())() -- Load all the functions from the DGS Resource
--- GUI Init
local URL_PAGE = "http://mta/[init]/register/src/register.html" -- Location of the HTML File (global)
local DGS_WINDOW = dgsCreateWindow(0.21, 0.20, 0.45, 0.45, "Registro", true,
                                   nil, nil, nil, nil, nil, tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS (global)
local BROWSER = dgsCreateBrowser(0, 0, 1, 1, true, DGS_WINDOW, true, true) -- Create the Browser (global)
--- GUI Parameters
dgsCenterElement(DGS_WINDOW) -- Center the DGS Window on the Screen (global)
dgsWindowSetSizable(DGS_WINDOW, false) -- Does the Window not Sizable (global)
dgsWindowSetMovable(DGS_WINDOW, false) -- Does the Window not Movable (global)
dgsWindowSetCloseButtonEnabled(DGS_WINDOW, false) -- Hidde the Close Window Button (global)
dgsSetVisible(DGS_WINDOW, false) -- Hidde the DGS Window (global)
dgsSetFont(DGS_WINDOW, "default-bold") -- Bold Font (global)
--- Functions
function createRegisterBrowserGUI()
    if not isElement(DGS_WINDOW) then
        DGS_WINDOW = dgsCreateWindow(0.21, 0.20, 0.45, 0.45, "Registro", true,
                                     nil, nil, nil, nil, nil,
                                     tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS
        BROWSER = dgsCreateBrowser(0, 0, 1, 1, true, DGS_WINDOW, true, true) -- Create the Browser
    end -- If the Browser GUI doesn't exist, create one

    dgsSetVisible(DGS_WINDOW, true)
    loadBrowserURL(BROWSER, URL_PAGE)
end -- Create the DGS GUI Browser
-- Events
event.load("register-browser:show", true)
event.add("register-browser:show", root,
          function() createRegisterBrowserGUI() end, true) -- Create the Event that Trigger the previous Function
