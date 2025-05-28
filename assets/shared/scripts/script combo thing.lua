local mCombo
local combo

function onCreate()
    makeLuaText("combo", 'Combo: 0', 200, -8, 259)
    setObjectCamera("combo", 'hud')
    setTextColor('combo', 'ffffff')
    setTextSize('combo', 20)
    addLuaText("combo")
    setTextFont('combo', "vcr.ttf")
    setTextAlignment('combo', 'center')

    makeLuaText("mCombo", 'Max Combo: 0', 200, getProperty('combo.x'), getProperty('combo.y') + 30)
    setObjectCamera("mCombo", 'hud')
    setTextColor('mCombo', 'fff700')
    setTextSize('mCombo', 20)
    addLuaText("mCombo")
    setTextFont('mCombo', "vcr.ttf")
    setTextAlignment('mCombo', 'center')

    makeLuaText("sick", 'Sicks!!: 0', 200, getProperty('combo.x'), getProperty('mCombo.y') + 30)
    setObjectCamera("sick", 'hud')
    setTextColor('sick', 'ffffff')
    setTextSize('sick', 20)
    addLuaText("sick")
    setTextFont('sick', "vcr.ttf")
    setTextAlignment('sick', 'center')
    setProperty('sick.alpha', 0.6)

    makeLuaText("good", 'Goods!: 0', 200, getProperty('combo.x'), getProperty('sick.y') + 30)
    setObjectCamera("good", 'hud')
    setTextColor('good', 'ffffff')
    setTextSize('good', 20)
    addLuaText("good")
    setTextFont('good', "vcr.ttf")
    setTextAlignment('good', 'center')
    setProperty('good.alpha', 0.6)

    makeLuaText("bad", 'Bads: 0', 200, getProperty('combo.x'), getProperty('good.y') + 30)
    setObjectCamera("bad", 'hud')
    setTextColor('bad', 'ffffff')
    setTextSize('bad', 20)
    addLuaText("bad")
    setTextFont('bad', "vcr.ttf")
    setTextAlignment('bad', 'center')
    setProperty('bad.alpha', 0.6)

    makeLuaText("shit", 'Shits: 0', 200, getProperty('combo.x'), getProperty('bad.y') + 30)
    setObjectCamera("shit", 'hud')
    setTextColor('shit', 'ffffff')
    setTextSize('shit', 20)
    addLuaText("shit")
    setTextFont('shit', "vcr.ttf")
    setTextAlignment('shit', 'center')
    setProperty('shit.alpha', 0.6)

    makeLuaText("miss", 'Misses: 0', 200, getProperty('combo.x'), getProperty('shit.y') + 30)
    setObjectCamera("miss", 'hud')
    setTextColor('miss', '36eaf7')
    setTextSize('miss', 20)
    addLuaText("miss")
    setTextFont('miss', "vcr.ttf")
    setTextAlignment('miss', 'center')
    setProperty('miss.alpha', 0.8)
end

function onCreatePost()
    maxComb = 0
end

function onUpdate(elapsed)
    local combo = getProperty('combo')
    local sicks = getProperty('sicks')
    local goods = getProperty('goods')
    local bads = getProperty('bads')
    local shits = getProperty('shits')
    local misss = getProperty('songMisses')

    if maxComb < combo then
        maxComb = combo
    end

    setTextString('combo', 'Combo: '.. combo)
    setTextString('mCombo', 'Max Combo: '.. maxComb)
    setTextString('sick', 'Sicks!!: '.. sicks)
    setTextString('good', 'Goods!: '.. goods)
    setTextString('bad', 'Bads: '.. bads)
    setTextString('shit', 'Shits: '.. shits)
    if misss < 1 then 
        setTextString('miss', 'Misses: FC')
    else
        setTextString('miss', 'Misses: '.. misss)
    end

    if sicks ~= 0 and goods == 0 and bads == 0 and shits == 0 then
        setTextColor('sick', '36eaf7')
        setProperty('sick.scale.x', getProperty('iconP1.scale.x') + 0.01)
        setProperty('sick.scale.y', getProperty('iconP1.scale.y') + 0.01)
    elseif goods > 0 or bads > 0 or shits > 0 then
        setTextColor('sick', 'ffffff')
        setProperty('sick.scale.x', 1)
        setProperty('sick.scale.y', 1)
    end

    if goods ~= 0 and bads == 0 and shits == 0 then
        setTextColor('good', '90ee90')
        setProperty('good.scale.x', getProperty('iconP1.scale.x'))
        setProperty('good.scale.y', getProperty('iconP1.scale.y'))
    elseif bads > 0 or shits > 0 then
        setTextColor('good', 'ffffff')
        setProperty('good.scale.x', 1)
        setProperty('good.scale.y', 1)
    end

    if bads ~= 0 and shits == 0 then
        setTextColor('bad', 'fffecb')
        setProperty('bad.scale.x', getProperty('iconP1.scale.x') - 0.01)
        setProperty('bad.scale.y', getProperty('iconP1.scale.y') - 0.01)
    elseif shits > 0 then
        setTextColor('bad', 'ffffff')
        setProperty('bad.scale.x', 1)
        setProperty('bad.scale.y', 1)
    end

    if misss > 0 then
        setTextColor('miss', 'ff0000')
        setProperty('miss.alpha', 1)
    end

    if sicks ~= 0 then setProperty('sick.alpha', 1) end
    if goods ~= 0 then setProperty('good.alpha', 1) end
    if bads ~= 0 then setProperty('bad.alpha', 1) end
    if shits ~= 0 then setProperty('shit.alpha', 1) end
end

function goodNoteHit()
    setProperty('combo.scale.x', 1.03)
    setProperty('combo.scale.y', 1.03)
    setProperty('mCombo.scale.x', 1.03)
    setProperty('mCombo.scale.y', 1.03)
    runTimer('hited', 0.07, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    setProperty('combo.scale.x', 1)
    setProperty('combo.scale.y', 1)
    if maxComb == getProperty('combo') then
        setProperty('mCombo.scale.x', 1)
        setProperty('mCombo.scale.y', 1)
    end
end