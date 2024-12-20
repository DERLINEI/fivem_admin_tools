-- 监听客户端的请求
RegisterServerEvent('admin_tools:kickPlayer')
AddEventHandler('admin_tools:kickPlayer', function(playerId)
    local playerName = GetPlayerName(playerId)
    DropPlayer(playerId, "You have been kicked by an admin.")
    TriggerClientEvent('chat:addMessage', -1, { args = { 'Admin', playerName .. ' has been kicked.' } })
end)

RegisterServerEvent('admin_tools:kickAllPlayers')
AddEventHandler('admin_tools:kickAllPlayers', function()
    local players = GetPlayers()
    for _, playerId in ipairs(players) do
        DropPlayer(playerId, "You have been kicked by an admin.")
    end
    TriggerClientEvent('chat:addMessage', -1, { args = { 'Admin', 'All players have been kicked.' } })
end)

RegisterServerEvent('admin_tools:mutePlayer')
AddEventHandler('admin_tools:mutePlayer', function(playerId)
    -- 假设你有个系统来禁言玩家
    TriggerClientEvent('chat:addMessage', -1, { args = { 'Admin', 'Player ' .. playerId .. ' is muted.' } })
end)

RegisterServerEvent('admin_tools:freezePlayer')
AddEventHandler('admin_tools:freezePlayer', function(playerId)
    -- 冻结玩家的代码（假设是冻结角色）
    TriggerClientEvent('chat:addMessage', -1, { args = { 'Admin', 'Player ' .. playerId .. ' is frozen.' } })
end)

RegisterServerEvent('admin_tools:changeWeather')
AddEventHandler('admin_tools:changeWeather', function(weatherType)
    -- 更改天气的代码（例如调用游戏内的天气系统）
    TriggerClientEvent('chat:addMessage', -1, { args = { 'Admin', 'Weather changed to ' .. weatherType } })
end)
