function onCreate()
    -- Iterar por todas as notas
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/Mechanics/Bullet-Note') -- Caminho da textura
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1)
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false) -- penalidade se errar
            end
        end
    end
end

local dodgeAnims = {'dodgeLEFT', 'dodgeDOWN', 'dodgeUP', 'dodgeRIGHT'}
local shootAnims = {'shootLEFT', 'shootDOWN', 'shootUP', 'shootRIGHT'}
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Bullet' then
        if getPropertyFromClass('ClientPrefs', 'difficulty') == 2 then -- Hard
            playSound('Engine/Shoot', 0.5)
        end

        characterPlayAnim('dad', shootAnims[direction + 1], true)
        characterPlayAnim('boyfriend', 'dodge', true)
        setProperty('boyfriend.specialAnim', true)
        setProperty('dad.specialAnim', true)

        cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    local diff = getPropertyFromClass('ClientPrefs', 'difficulty')
    if noteType == 'Bullet' then
        if diff == 2 then -- Hard
            setProperty('health', -1)
            playSound('Engine/ShootMiss', 0.5)
        elseif diff == 1 then -- Normal
            setProperty('health', getProperty('health') - 0.8)
            runTimer('bleed', 0.2, 20)
            playSound('hankded', 0.6)
            characterPlayAnim('boyfriend', 'hurt', true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'bleed' then
        setProperty('health', getProperty('health') - 0.001)
    end
end
