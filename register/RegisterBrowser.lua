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
loadstring(exports.dgs:dgsImportFunction())()

windowMenu = dgsCreateWindow(0.21, 0.20, 0.45, 0.45, "Registro", true, nil, nil,
                             nil, nil, nil, tocolor(0, 0, 0, 0))
webBrowser = dgsCreateBrowser(0, 0, 1, 1, true, windowMenu, true, true)
dgsSetVisible(windowMenu, false)
dgsCenterElement(windowMenu)
dgsWindowSetSizable(windowMenu, false)
dgsWindowSetMovable(windowMenu, false)
dgsWindowSetCloseButtonEnabled(windowMenu, false)
dgsSetFont(windowMenu, "default-bold")
function createRegisterBrowserGUI()
    dgsSetVisible(windowMenu, true)
    loadBrowserURL(webBrowser, "http://mta/[init]/register/src/register.html")
end

event.load("register-browser:show", true)
event.add("register-browser:show", root,
          function() createRegisterBrowserGUI() end, true)
