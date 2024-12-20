// 显示菜单
function openMenu() {
    document.getElementById("menu").style.display = "block";
    document.getElementById("menu").style.pointerEvents = "auto";
}

// 关闭菜单
function closeMenu() {
    document.getElementById("menu").style.display = "none";
    document.getElementById("menu").style.pointerEvents = "none";
}

// 发送请求的封装函数
function sendAdminRequest(action, playerId = null, weather = null) {
    fetch(`https://admin_tools/${action}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ playerId: playerId, weather: weather })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`${action} completed successfully!`);
        } else {
            console.error(`${action} failed:`, data.error);
        }
    })
    .catch(error => {
        console.error(`Error with ${action}:`, error);
    });
}

// 玩家踢出
function kickPlayer(playerId) {
    console.log(`kickPlayer called for ${playerId}`);
    sendAdminRequest('kickPlayer', playerId);
}

// 踢出所有玩家
function kickAllPlayers() {
    console.log('kickAllPlayers called');
    sendAdminRequest('kickAllPlayers');
}

// 禁言玩家
function mutePlayer(playerId) {
    console.log(`mutePlayer called for ${playerId}`);
    sendAdminRequest('mutePlayer', playerId);
}

// 冻结玩家
function freezePlayer(playerId) {
    console.log(`freezePlayer called for ${playerId}`);
    sendAdminRequest('freezePlayer', playerId);
}

// 更改天气
function changeWeather(weatherType) {
    console.log(`changeWeather called for ${weatherType}`);
    sendAdminRequest('changeWeather', null, weatherType);
}
