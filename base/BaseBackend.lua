---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                          Name-Script: [BaseBackend]                           |---
---|        Function-Script: Call and execute some events from Login and Base      |---
---|                                                                               |---
---|                            DEV-DATE: 02/07/2020                               |---
---|                               Server Script                                   |---
---|                                number: 002                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Server Variables
event = {add = addEventHandler, load = addEvent, execute = triggerClientEvent} -- Make simple calls for addEvent and triggerClientEvent by the variable event
--- Functions
local function showBase(player) event.execute(player, "base-camera:on", player) end -- Function that Remove the Login Browser and turn on the Camera

local function openBaseRegister(player)
    event.execute(player, "login-browser:remove", player)
    event.execute(player, "register-browser:show", player)
end
--- Events Created
event.load("base-backend:show", true)
event.add("base-backend:show", root, function() showBase(client) end)

event.load("base-backend-register:show", true)
event.add("base-backend-register:show", root, function()
    showBase(client)
    openBaseRegister(client)
end) -- Execute some Events from Login and Base

