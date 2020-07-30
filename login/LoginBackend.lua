---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                          Name-Script: [LoginBackend]                          |---
---|      Function-Script: Try to acces to an Account by the parameters gived      |---
---|                        by the Browser GUI using an Event                      |---
---|                                                                               |---
---|                            DEV-DATE: 21/06/2020                               |---
---|                               Server Script                                   |---
---|                                number: 002                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Server Variables
event = {add = addEventHandler, load = addEvent, execute = triggerClientEvent} -- Make simple calls for addEvent and triggerClientEvent by the variable event
--- Variable Error
local error = {
    message = {
        account = "La cuenta no existe en la Base de Datos [ERROR 3]",
        information = "La información ingresada es incorrecta [ERROR 4]"
    },
    type = "5"
} -- Make simple String calls for errors (account, information) by the variable error
--- Functions
function loginAttempt(player, user, password)
    local account = getAccount(user) -- Check on the Database the User
    if not account then -- If the account doesn't exist        
        event.execute(player, 'login-tooltip-browser:show', player,
                      error.message.account, error.type) -- Trigger an Event that shows the error.account on the Browser
    else
        local hashed_password = getAccountData(account, 'hashed_password') -- Get the encrypt password from the Account
        passwordVerify(password, hashed_password, function(areEqual)
            if not areEqual then -- If the Password is incorrect
                event.execute(player, 'login-tooltip-browser:show', player,
                              error.message.information, error.type) -- Trigger an Event that shows the error.information on the Browser
            else
                if logIn(player, account, hashed_password) then
                    spawnPlayer(player, 1280, 250, 20)
                    fadeCamera(player, true)
                    setCameraTarget(player, player)
                    for i = 1, 16 do
                        outputChatBox(' ', player)
                    end
                    return event.execute(player, 'login-browser:remove', player) -- Trigger an Event that Removes the Browser GUI
                end -- If the User login succesfully then spawn and set the camera to the Player
            end
        end) -- Verify if the Password is equal to the Account Password
    end -- Verify if the account exists
end -- This function try to Login into the account if it can't send an Error
--- Events Created
event.load("login-backend:execute", true)
event.add("login-backend:execute", root,
          function(user, password) loginAttempt(client, user, password) end) -- An Event that try to acces to the Account by the User and Password
--- MTA Events          
event.add("onPlayerLogout", root,
          function() event.execute(source, "login-browser:show", source) end) -- When the Player Logout the Session Open the Browser GUI
