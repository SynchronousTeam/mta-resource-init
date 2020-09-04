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

local const ={MINIMUM_PASSWORD_LENGHT = 6}

--- Verify Functions
function ispasswordvalid(password)
    return string.len(password) >= const.minimum_password_lenght
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
function registerAttempt(player, username, password, discordID) 
    local db = exports.db:getConnection()

    local adminMember = false
    local inmortalMember = false
    local moderatorMember = false
    local test2 = getError('notFoundAccount').type

    if not username or not password then 
        event.execute(player, "register-tooltip-browser:show", player,test,test2 )
    end
    ---Revisar en la Base de Datos
    if getAccount(username) then
        return outputChatBox('Una cuenta ya existe con ese nombre.', player,
            255, 100, 100)
    end
    ---Revisar en la Base de Datos discordID
    if existDiscordID(discordID) then
        return outputChatBox('Una cuenta ya existe con esa id de Discord.',
            player, 255, 100, 100)
    end
    ---Contraseña valida
    if not isPasswordValid(password) then
        return outputChatBox('La contraseña digitada no es valida.', player,
            255, 100, 100)
    end
    --- CREAR HASH para la contraseña
    passwordHash(password, 'bcrypt', {}, function(hashedPassword)
        ---create the account
        local account = addAccount(username, hashedPassword)
        setAccountData(account, 'hashed_password', hashedPassword)
        ---Verificación exitosa
        outputChatBox('Tu cuenta fue exitosamente creada!', player, 100, 255,
            100)
        end)

        setTimer(function()
            ---Revisar los Roles del Usuario en Discord
            if isMemberMod(discordID) then
                moderatorMember = true
                triggerEvent('mod:rank-attempt', player, username, "Moderator")
            end
            if isMemberInmortal(discordID) then
                inmortalMember = true
                triggerEvent('mod:rank-attempt', player, username, "SuperModerator")
            end
            if isMemberAdmin(discordID) then
                adminMember = true
                triggerEvent('mod:rank-attempt', player, username, "Admin")
            end

            dbExec(db,
                'INSERT INTO Players (account,password,discordID,adminMember,inmortalMember,moderatorMember,vipMember,subMember,characters) VALUES (?,?,?,?,?,?,?,?,?)',
                username, password, discordID, adminMember, inmortalMember,
                moderatorMember, false, false, 0)
        end, 1000, 1)
end
