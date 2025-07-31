function onCreate()
    local barValue = ClientPrefs.data.Bar -- pega o valor da preferência
    makeLuaText('healthText', 'Health:' .. math.floor(getProperty("health") * 50) .. ' | Bar: ' .. tostring(barValue), 500, -500)
    addLuaText('healthText')
    setTextSize('healthText', 25)
end

function onUpdate(elapsed)
    local barValue = ClientPrefs.data.Bar
    setTextString('healthText', 'Health: ' .. math.floor(getProperty("health") * 50) .. ' | Bar: ' .. tostring(barValue))
end