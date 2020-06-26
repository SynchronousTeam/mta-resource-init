---Global Variables
local MINIMUM_PASSWORD_LENGHT = 6
---Personal
local function isPasswordValid(password)
    return string.len(password) >= MINIMUM_PASSWORD_LENGHT
end

local function existDiscordID(discordID)
    ---READING database
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

local function isMemberAdmin(discordID)
    ---READING database
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

local function isMemberInmortal(discordID)
    ---READING database
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

local function isMemberMod(discordID)
    ---READING database
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

---crear una cuenta
addEvent('auth:register-attempt', true)
addEventHandler("auth:register-attempt", root,
                function(username, password, discordID)
    ---Init Database
    local db = exports.db:getConnection()
    ---Variables
    local player = source
    local adminMember = false
    local inmortalMember = false
    local moderatorMember = false
    ---Username or Password
    if not username or not password then
        return outputChatBox('SYNTAX: /' .. command .. ' [username] [password]',
                             player, 255, 255, 255)
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

end)

---ingresar a tu cuenta
addEvent('auth:login-attempt', true)
addEventHandler('auth:login-attempt', root, function(username, password)
    local account = getAccount(username)
    local player = source
    if not account then
        outputChatBox('No se encuentra la cuenta en la base de datos.', player,
                      255, 100, 255)
    end
    local hashedPassword = getAccountData(account, 'hashed_password')
    passwordVerify(password, hashedPassword, function(isValid)
        if not isValid then
            return outputChatBox('La contraseña no es correcta.', player, 255,
                                 100, 255)
        end
        if logIn(player, account, hashedPassword) then
            spawnPlayer(player, 1280, 250, 20)
            setCameraTarget(player, player)
            return triggerClientEvent(player, 'login-menu:close', player)
        end

        return outputChatBox(
                   'Un error desconocido a sucedido mientras se autenticaba la sesión',
                   player, 255, 100, 255)
    end)
end)
---salir de tu cuenta

addCommandHandler('accountLogout', function(player, command) logOut(player) end)
