-- bf.lua
-- filepath: assets/scripts/characters/bf.lua

function onCreate()
    -- Inicialização do personagem, se necessário
end

function playAnimation(name, restart, ignoreOther)
    if name == "fakeoutDeath" and not debug then
        doFakeoutDeath()
    else
        -- Chame a animação padrão do personagem
        characterPlayAnimation(name, restart, ignoreOther)
    end
end

function doFakeoutDeath()
    playSound('Engine/gameover/bf/fakeout_death', 1.0)

    local bfFakeout = makeAnimatedLuaSprite('bfFakeout', 'characters/bfFakeOut', getProperty('boyfriend.x') - 440, getProperty('boyfriend.y') - 240)
    addLuaSprite('bfFakeout', true)
    setProperty('bfFakeout.zIndex', 1000)
    playAnim('bfFakeout', 'idle', true)
    setProperty('mustHitSection', false) -- Impede saída prematura

    function onAnimFinished(tag, anim)
        if tag == 'bfFakeout' then
            setProperty('bfFakeout.visible', false)
            setProperty('boyfriend.visible', true)
            setProperty('mustHitSection', true)
            playAnimation('firstDeath', true, true)
            playBlueBalledSFX()
        end
    end

    setProperty('bfFakeout.visible', true)
    setProperty('boyfriend.visible', false)
end

function getDeathQuote()
    local dadChar = getProperty('dad.curCharacter')
    if dadChar == 'tankman' then
        local randomCensor = {}
        if not getPropertyFromClass('Preferences', 'naughtyness') then
            randomCensor = {1, 3, 8, 13, 17, 21}
        end
        local quoteNum = getRandomInt(1, 25, randomCensor)
        return 'jeffGameover/jeffGameover-' .. quoteNum
    end
    return nil
end

-- Helper para tocar o som "blue balled"
function playBlueBalledSFX()
    playSound('gameplay/gameover/blue_balled', 1.0)
end