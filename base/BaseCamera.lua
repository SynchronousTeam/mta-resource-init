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
--- Functions
local function onBaseCamera(POSITION_X, POSITION_Y, POSITION_Z, ROTATION_X,
                            ROTATION_Y, ROTATION_Z, CAMERA_IN_OPACITY,
                            base_game_hud_component)
    for i = 1, table.getn(base_game_hud_component) do
        setPlayerHudComponentVisible(base_game_hud_component[i], false)
    end -- This for removes all the HUD Components catched from the array base_component        
    showCursor(true)
    showChat(false)
    fadeCamera(true, CAMERA_IN_OPACITY) -- Slowly fade the camera in to make the screen visible 
    setCameraMatrix(POSITION_X, POSITION_Y, POSITION_Z, ROTATION_X, ROTATION_Y,
                    ROTATION_Z) -- set the player's camera to a fixed position, looking at a fixed point    
end -- Function that initialice the Register Base
--- Events Created
event.load('base-camera:on', true)
event.add('base-camera:on', root,
          function(POSITION_X, POSITION_Y, POSITION_Z, ROTATION_X, ROTATION_Y,
                   ROTATION_Z, CAMERA_IN_OPACITY, base_game_hud_component)
    onBaseCamera(POSITION_X, POSITION_Y, POSITION_Z, ROTATION_X, ROTATION_Y,
                 ROTATION_Z, CAMERA_IN_OPACITY, base_game_hud_component)
end, true) -- An event that turns ON the Camera and taks a City shot 

event.load('base-camera-register:show', true)
event.add('base-camera-register:show', root, function()
    event.execute('base-backend-register:show', resourceRoot)
end, true)
