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
local const = {
    position = {X_WINDOW = 0.21, Y_WINDOW = 0.20, NONE = 0},
    size = {
        W_WINDOW = 0.45,
        H_WINDOW = 0.45,
        W_BROWSER = 1,
        H_BROWSER = 1,
        TITLE_SIZE = 0
    },
    text = {NAME_WINDOW = "Registro"}
}
--- GUI Init
local REGISTER_URL_PAGE = "http://mta/[init]/register/src/register.html" -- Location of the HTML File (global)
local REGISTER_DGS_WINDOW = dgsCreateWindow(const.position.X_WINDOW,
                                            const.position.Y_WINDOW,
                                            const.size.W_WINDOW,
                                            const.size.H_WINDOW,
                                            const.text.NAME_WINDOW, true, nil,
                                            const.size.TITLE_SIZE, nil, nil,
                                            nil, tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS (global)
local REGISTER_BROWSER = dgsCreateBrowser(const.size.NONE, const.size.NONE,
                                          const.size.W_BROWSER,
                                          const.size.H_BROWSER, true,
                                          REGISTER_DGS_WINDOW, true, true) -- Create the Browser (global)
--- GUI Parameters
dgsCenterElement(REGISTER_DGS_WINDOW) -- Center the DGS Window on the Screen (global)
dgsWindowSetSizable(REGISTER_DGS_WINDOW, false) -- Does the Window not Sizable (global)
dgsWindowSetMovable(REGISTER_DGS_WINDOW, false) -- Does the Window not Movable (global)
dgsWindowSetCloseButtonEnabled(REGISTER_DGS_WINDOW, false) -- Hidde the Close Window Button (global)
dgsSetVisible(REGISTER_DGS_WINDOW, false) -- Hidde the DGS Window (global)
dgsSetFont(REGISTER_DGS_WINDOW, "default-bold") -- Bold Font (global)
--- Functions
function createRegisterBrowserGUI()
    if not isElement(REGISTER_DGS_WINDOW) then
        REGISTER_DGS_WINDOW = dgsCreateWindow(const.position.X_WINDOW,
                                              const.position.Y_WINDOW,
                                              const.size.W_WINDOW,
                                              const.size.H_WINDOW,
                                              const.text.NAME_WINDOW, true, nil,
                                              const.size.TITLE_SIZE, nil, nil,
                                              nil, tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS
        REGISTER_BROWSER = dgsCreateBrowser(const.size.NONE, const.size.NONE,
                                            const.size.W_BROWSER,
                                            const.size.H_BROWSER, true,
                                            REGISTER_DGS_WINDOW, true, true) -- Create the Browser
    end -- If the Browser GUI doesn't exist, create one

    dgsSetVisible(REGISTER_DGS_WINDOW, true)
    loadBrowserURL(REGISTER_BROWSER, REGISTER_URL_PAGE)
end -- Create the DGS GUI Browser
-- Events
event.load("register-browser:show", true)
event.add("register-browser:show", root,
          function() createRegisterBrowserGUI() end, true) -- Create the Event that Trigger the previous Function
--- Import MTA Functions
event.load("register-tooltip-browser:show", true)
event.add("register-tooltip-browser:show", root, function(message)
    register_tooltip_error_send = exports["[tooltip]"]:showTooltipError(message)
end, true)
