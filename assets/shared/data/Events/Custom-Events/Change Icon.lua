local contents = {idk = {}, rgb = {}, result}
function onEvent(name, value1, value2)
	if name == 'Change Icon' then
        contents.idk = Split(value1, ',')
        contents.rgb = Split(value2, ',')
        if contents.rgb[1] == 'rgb' then
            contents.result = rgbToHex({tonumber(contents.rgb[2]), tonumber(contents.rgb[3]), tonumber(contents.rgb[4])})
        elseif contents.rgb[1] == 'hex' then
            contents.result = contents.rgb[2]
        else
            debugPrint('COLOR TYPE "' .. contents.rgb[1] .. '" IS INVALID')
        end
        swapIcon(contents.idk[1], contents.idk[2], trim(contents.result))
	end
end

function swapIcon(char, icon, color)
    icon = trim(icon)
    if char == 'bf' or char == 'dad' then
        setHealthBarColors((char == 'dad' and color or rgbToHex(getProperty('dad.healthColorArray'))), (char == 'bf' and color or rgbToHex(getProperty('boyfriend.healthColorArray'))))
        runHaxeCode([[game.icon]] .. (char == 'dad' and 'P2' or char == 'bf' and 'P1') .. [[.changeIcon(']] .. icon .. [[')]])
        setProperty((char == 'dad' and 'dad' or char == 'bf' and 'boyfriend') .. '.healthIcon', icon)
    else
        debugPrint('CHARACTER TYPE "' .. char .. '" IS INVALID')
    end
end

function Split(s, delimiter)
	result = {}
	for match in (s..delimiter):gmatch('(.-)'..delimiter) do
		table.insert(result, tostring(match))
	end
	return result
end

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
    return string.format("%02x%02x%02x",math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end