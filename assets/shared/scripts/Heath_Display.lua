if not getPropertyFromClass('ClientPrefs','healthBar') then

    makeLuaText('healthText', 'remaining life: ' .. math.floor(getProperty("health") * 50), 500, -500)
    addLuaText('healthText')
    addLuaText('healthText', 500, -500)
    setTextSize('healthText', 25);
end
function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
    setTextString('healthText', 'remaining life: ' .. math.floor(getProperty("health") * 50))
end

