---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     code script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                          Name-Script: [RegisterBackend]                       |---
---|        Function-Script: Try to create an Account by the parameters gived      |---
---|                   by the Register Browser GUI using an Event                  |---
---|                                                                               |---
---|                            DEV-DATE: 02/07/2020                               |---
---|                               Server Script                                   |---
---|                                number: 002                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
--- Server Variables
event = {add = addEventHandler, load = addEvent, execute = triggerClientEvent} -- Make simple calls for addEvent and triggerClientEvent by the variable event
local MINIMUM_PASSWORD_LENGHT = 6

local error = {} -- Make simple String calls for errors (account, information) by the variable error
--- Verify Functions
function isPasswordValid(password)
    return string.len(password) >= MINIMUM_PASSWORD_LENGHT
end -- Verify the required minimun lenght for a password

function existDiscordID(discordID)
    local exist = false
    local db = exports.db:getConnection()
    local queryhandle = dbQuery(db, 'SELECT * from Players WHERE discordID=?',
                                discordID)
    local result = dbPoll(queryhandle, -1)
    for rid, row in ipairs(result) do
        for column, value in pairs(row) do
            if value ~= nil then exist = true end
        end
    end
    return exist
end

function isMemberAdmin(discordID)
    local admin = false
    local db_discord = exports.db_discord:getConnectionDiscord()
    local queryhandle = dbQuery(db_discord,
                                'SELECT adminMember from GuildMembers WHERE memberID=?',
                                discordID)
    local result = dbPoll(queryhandle, -1)
    for rid, row in ipairs(result) do
        for column, value in pairs(row) do
            if tonumber(value) == 1 then admin = true end
        end
    end
    return admin
end

function isMemberInmortal(discordID)
    local inmortal = false
    local db_discord = exports.db_discord:getConnectionDiscord()
    local queryhandle = dbQuery(db_discord,
                                'SELECT inmortalMember from GuildMembers WHERE memberID=?',
                                discordID)
    local result = dbPoll(queryhandle, -1)
    for rid, row in ipairs(result) do
        for column, value in pairs(row) do
            if tonumber(value) == 1 then inmortal = true end
        end
    end
    return inmortal
end

function isMemberMod(discordID)
    local moderator = false
    local db_discord = exports.db_discord:getConnectionDiscord()
    local queryhandle = dbQuery(db_discord,
                                'SELECT moderatorMember from GuildMembers WHERE memberID=?',
                                discordID)
    local result = dbPoll(queryhandle, -1)
    for rid, row in ipairs(result) do
        for column, value in pairs(row) do
            if tonumber(value) == 1 then moderator = true end
        end
    end
    return moderator
end
--- Call Functions
function registerAttempt(username, password, discordID)
    
end
