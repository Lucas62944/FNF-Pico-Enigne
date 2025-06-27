function onCreatePost()
    if not shadersEnabled then return end

    initLuaShader('Light_Shader')

    -- change values if you want
    local chars = {
        boyfriend = {
            angle = 90,
            lightOpacity = 1,            thr = 0.1,
            useMask = true,
            thr2 = 0.1,
            dist = 15,
            brightness = -46,
            hue = -38,
            contrast = -25,
            saturation = -20
        },
        gf = {
            angle = 90,
            lightOpacity = 1,            thr = 0.1,
            useMask = true,
            thr2 = 0.1,
            dist = 15,
            brightness = -46,
            hue = -38,
            contrast = -25,
            saturation = -20
        },
        dad = {
            angle = 135,
            lightOpacity = 1,            thr = 0.3,
            useMask = true,
            thr2 = 0.1,
            dist = 15,
            brightness = -46,
            hue = -38,
            contrast = -25,
            saturation = -20
        }
    }

    for char, data in pairs(chars) do
        setSpriteShader(char, 'Light_Shader')

        -- Luz e máscara
        setShaderFloat(char, 'thr', data.thr)
        if data.thr2 then setShaderFloat(char, 'thr2', data.thr2) end
        setShaderFloat(char, 'ang', math.rad(data.angle))
        setShaderBool(char, 'useMask', data.useMask)
        setShaderFloat(char, 'dist', data.dist)

        -- Anti-alias e força do efeito
        setShaderFloat(char, 'AA_STAGES', 2)
        setShaderFloat(char, 'str', 0.8)

        -- Ajustes de cor personalizados
        setShaderFloat(char, 'brightness', data.brightness or 0)
        setShaderFloat(char, 'hue', data.hue or 0)
        setShaderFloat(char, 'contrast', data.contrast or 0)
        setShaderFloat(char, 'saturation', data.saturation or 0)
        setShaderFloat(char, 'lightOpacity', data.lightOpacity or 1)

        setShaderFloatArray(char, 'dropColor', {223/255, 239/255, 100/255})

        -- Frame info
        updateFrameInfo(char)
    end
end

function onUpdatePost()
    if not shadersEnabled then return end
    for char in pairs({boyfriend=true, gf=true, dad=true}) do
        updateFrameInfo(char)
    end
end

function updateFrameInfo(s)
    if getProperty(s..'.pixel') then return end
    setShaderFloatArray(s, 'uFrameBounds', {
        getProperty(s..'.frame.uv.x'),
        getProperty(s..'.frame.uv.y'),
        getProperty(s..'.frame.uv.width'),
        getProperty(s..'.frame.uv.height')
    })
end

local bg = "tankman-pico/bg"
local guy = "tankman-pico/guy"
local sniper = "tankman-pico/sniper"

function onCreate()
	----bg----
	makeLuaSprite('bg', bg, -1250, -850)
	scaleObject('bg', 1.2, 1.2)	
	setProperty('bg.antialiasing',true)
	addLuaSprite('bg', false)

	makeAnimatedLuaSprite('sniper', sniper, -330, 350)
	scaleObject('sniper', 1.2, 1.2)
	addAnimationByPrefix('sniper', 'idle', 'tanksippingBaked instance', 24, true)
	addLuaSprite('sniper',false)
	setProperty('sniper.antialiasing',true)

	makeAnimatedLuaSprite('guy', guy, 1220, 420)
	scaleObject('guy', 1.2, 1.2)
	addAnimationByPrefix('guy', 'idle', 'BLTank2 instance 1', 24, true)
	addLuaSprite('guy',false)
	setProperty('guy.antialiasing',true)

end