-- client.lua

-- 显示管理菜单
RegisterCommand('adminmenu', function()
    SetNuiFocus(true, true)  -- 显示UI
    SendNUIMessage({ type = 'showMenu' })  -- 发送打开菜单的消息
end, false)

-- 关闭菜单
function closeMenu()
    SetNuiFocus(false, false)  -- 关闭UI
    SendNUIMessage({ type = 'hideMenu' })  -- 隐藏菜单
end

-- 玩家操作函数
function kickPlayer(playerId)
    print('kickPlayer called for', playerId)  -- 调试日志
    TriggerServerEvent('adminTools:kickPlayer', playerId)  -- 触发服务器事件
    closeMenu()  -- 关闭UI
end

function kickAllPlayers()
    print('kickAllPlayers called')  -- 调试日志
    TriggerServerEvent('adminTools:kickAll')  -- 触发服务器事件
    closeMenu()  -- 关闭UI
end

function mutePlayer(playerId)
    TriggerServerEvent('adminTools:mutePlayer', playerId)  -- 禁言玩家
    closeMenu()  -- 关闭UI
end

function freezePlayer(playerId)
    TriggerServerEvent('adminTools:freezePlayer', playerId)  -- 冻结玩家
    closeMenu()  -- 关闭UI
end

function changeWeather(weatherType)
    TriggerServerEvent('adminTools:changeWeather', weatherType)  -- 更改天气
    closeMenu()  -- 关闭UI
end

-- 监听 ESC 键关闭菜单
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 177) then  -- 按 ESC 键关闭菜单
            closeMenu()
        end
    end
end)
