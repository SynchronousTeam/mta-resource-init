---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                           Name-Script: [BaseCamera]                           |---
---|         Function-Script: Enable the Camera, choose a place and makes          |---
---|                           not visible the Game HUD                            |---
---|                                                                               |---
---|                            DEV-DATE: 27/06/2020                               |---
---|                               Client Script                                   |---
---|                                number: 001                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
POINT_X, POINT_Y, POINT_Z = 1488, 250, 53 -- Set the Default Camera Position
ROTATION_X, ROTATION_Y, ROTATION_Z = 0, 90, -65 -- Set the Default Camera Rotation
--- Functions
function onBaseCamera(POINT_X, POINT_Y, POINT_Z, ROTATION_X, ROTATION_Y,
                      ROTATION_Z)
    setPlayerHudComponentVisible("radar", false)
    setPlayerHudComponentVisible("area_name", false)
    showCursor(true)
    showChat(false)
    fadeCamera(true, 3) -- Slowly fade the camera in to make the screen visible 
    setCameraMatrix(POINT_X, POINT_Y, POINT_Z, ROTATION_X, ROTATION_Y,
                    ROTATION_Z) -- set the player's camera to a fixed position, looking at a fixed point
end -- Function that initialice the Register Base
--- Events Created
event.load('base-camera:sendData', true)
event.add('base-camera:sendData', root,
          function() event.execute('base-backend:execute', resourceRoot) end,
          true) -- Get the JavaScript Call

event.load('base-camera:on', true)
event.add('base-camera:on', root, function()
    onBaseCamera(POINT_X, POINT_Y, POINT_Z, ROTATION_X, ROTATION_Y, ROTATION_Z)
end, true) -- An event that turns ON the Camera and taks a City shot 
