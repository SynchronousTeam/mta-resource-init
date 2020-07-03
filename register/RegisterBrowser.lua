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
DGS = exports.dgs
WINDOW_REGISTER = DGS:dgsCreateWindow(0.21, 0.20, 0.57, 0.60, "Registrarse",
                                      true, nil, nil, nil, nil, nil,
                                      toColor(0, 0, 0, 0))
local BROWSER = DGS:dgsCreateBrowser(0, 0, 1, 1, true, WINDOW_REGISTER, true,
                                     true)
setDevelopmentMode(true, true)

event.load("register-browser:show", true)
event.add("register-browser:show", root, function()
    addEventHandler("onClientBrowserCreated", BROWSER, function()
        loadBrowserURL(BROWSER, "http://mta/register/src/register.html")
        toggleBrowserDevTools(BROWSER, true)
    end)
end)
