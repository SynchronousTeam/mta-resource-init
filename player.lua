--- Event Player Join the Game
addEventHandler('onPlayerJoin', root, function()    
end) --- FIN EVENT onPlayerJoin
---Commands 
addCommandHandler('clear', function(player)
    for i = 1, 16 do outputChatBox(' ', player) end
end)
