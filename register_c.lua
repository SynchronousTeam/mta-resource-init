-- Functions
local function getWindowPosition(width, height)
    local screenWidth, screenHeight = guiGetScreenSize()
    local x = (screenWidth / 2) - (width / 2)
    local y = (screenHeight / 2) - (height / 2)
    return x, y, width, height
end

function centerWindow(center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) / 2, (screenH - windowH) / 2
    return guiSetPosition(center_window, x, y, false)
end

function centerWindowX(center_window, y)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x = (screenW - windowW) / 2
    return guiSetPosition(center_window, x, y, false)
end

--- Register Functions
local function isUsernameValid(username)
    return type(username) == 'string' and string.len(username) > 1 and
               string.len(username) < 20
end

local function isDiscordIDValid(id)
    return string.len(id) > 10 and tonumber(id) and string.len(id) < 25
end

local function areEqualPasswords(pass1, pass2) return pass1 == pass2 end

local function isPasswordValid(password)
    return type(password) == 'string' and string.len(password) > 1 and
               string.len(password) < 25
end
---Images Labels
local registerWindow = nil
local panelFondo = nil
---Creando eventos
addEvent('register-menu:open', true)
addEventHandler('register-menu:open', root, function()
    local screenWidth, screenHeight = guiGetScreenSize()
    local x, y, width, height = getWindowPosition(880.472, 549, 72)
    ---Important Variables
    setPlayerHudComponentVisible("radar", false)
    showCursor(true, true)
    guiSetInputMode("no_binds")
    ---Create PanelFondo
    outputChatBox("h " .. height .. " w " .. width)
    panelFondo = guiCreateStaticImage(0, screenHeight * 0.712, screenWidth + 6,
                                      height * 0.5457, "images/FondoPanel.png",
                                      false)
    ---Panel Proppertys
    guiSetAlpha(panelFondo, 0.7)
    ---Creating Label Login
    registerWindow = guiCreateStaticImage(x, y, width, height,
                                          "images/LabelRegister.png", false)
    guiBringToFront(registerWindow)
    guiWindowSetMovable(registerWindow, false)
    guiWindowSetSizable(registerWindow, false)
    ---Inputs    
    local usernameInput = guiCreateEdit(70, 217, width * 0.25, height * 0.0544,
                                        '', false, registerWindow)

    local passwordInput = guiCreateEdit(70, 330, width * 0.25, height * 0.0544,
                                        '', false, registerWindow)

    local confirmPasswordInput = guiCreateEdit(70, 445, width * 0.25,
                                               height * 0.0544, '', false,
                                               registerWindow)

    local discordIDInput = guiCreateEdit(560, 217, width * 0.25,
                                         height * 0.0544, '', false,
                                         registerWindow)
    ---Label Errors
    local errorLabelUsername = guiCreateLabel(60, 260, 315, 20,
                                              '*El usuario digitado no es permitido* [ERROR 1]',
                                              false, registerWindow)
    local errorLabelPassword = guiCreateLabel(60, 372, 315, 20,
                                              '*La contraseña digitada no es válida* [ERROR 2]',
                                              false, registerWindow)
    local errorLabelConfirmPassword = guiCreateLabel(60, 486, 315, 20,
                                                     '*Las contraseñas no son idénticas* [ERROR 3]',
                                                     false, registerWindow)
    local errorLabelDiscord = guiCreateLabel(560, 260, 315, 20,
                                             '*La ID digitada no es válida* [ERROR 4]',
                                             false, registerWindow)

    ---Label Propertys
    guiLabelSetColor(errorLabelUsername, 234, 32, 70)
    guiLabelSetColor(errorLabelPassword, 234, 32, 70)
    guiLabelSetColor(errorLabelConfirmPassword, 234, 32, 70)
    guiLabelSetColor(errorLabelDiscord, 234, 32, 70)
    guiSetVisible(errorLabelDiscord, false)
    guiSetVisible(errorLabelConfirmPassword, false)
    guiSetVisible(errorLabelPassword, false)
    guiSetVisible(errorLabelUsername, false)
    ---Password Input Functions
    guiEditSetMasked(passwordInput, true)
    guiEditSetMasked(confirmPasswordInput, true)
    ---CreatingLabel Button Login & Selected Login
    local loginButton = guiCreateStaticImage(700, 435, 162.5, 50,
                                             "images/LoginButtonr.png", false,
                                             registerWindow)
    -- CreatingLabel Button Login & Selected Login   
    local registerButton = guiCreateStaticImage(520, 435, 162.5, 50,
                                                "images/RegisterButtonr.png",
                                                false, registerWindow)
    ---Events Button Login & Selected Login    
    addEventHandler('onClientGUIClick', registerButton, function(button, state)
        -- Button & Click Validation
        if button ~= 'left' or state ~= 'up' then return end
        ---Input Text Variables
        local username = guiGetText(usernameInput)
        local password = guiGetText(passwordInput)
        local verifyPassword = guiGetText(confirmPasswordInput)
        local discordID = guiGetText(discordIDInput)
        local inputInvalid = true
        ---Errors Propertys
        guiSetVisible(errorLabelUsername, false)
        guiSetVisible(errorLabelPassword, false)
        guiSetVisible(errorLabelConfirmPassword, false)
        guiSetVisible(errorLabelDiscord, false)
        ---Login Validations
        if not isUsernameValid(username) then
            guiSetVisible(errorLabelUsername, true)
            inputInvalid = false
        end

        if not isPasswordValid(password) then
            guiSetVisible(errorLabelPassword, true)
            inputInvalid = false
        end

        if not areEqualPasswords(password, verifyPassword) then
            guiSetVisible(errorLabelConfirmPassword, true)
            inputInvalid = false
        end

        if not isDiscordIDValid(discordID) then
            guiSetVisible(errorLabelDiscord, true)
            inputInvalid = false
        end

        if not inputInvalid then return end
        triggerServerEvent('auth:register-attempt', localPlayer, username,
                           password, discordID)
    end, false)
    addEventHandler('onClientGUIClick', loginButton, function(button, state)
        -- Button & Click Validation
        if button ~= 'left' or state ~= 'up' then return end

        triggerEvent('register-menu:close', localPlayer)
        triggerEvent('login-menu:open', localPlayer)
    end, false)
end, true)

addEvent('register-menu:close', true)
addEventHandler('register-menu:close', root, function()
    ---Destroying Panels and Important Elements
    destroyElement(registerWindow)
    destroyElement(panelFondo)
    ---Important Variables
    setPlayerHudComponentVisible("radar", true)
    showCursor(false)
    guiSetInputMode("allow_binds")
end)
