local playedComboAnim = false
local lastCombo = 0

function goodNoteHit(isSustainNote)
    lastCombo = combo -- atualiza o último combo com base no hit atual

    if combo == 50 and not playedComboAnim then
        setProperty('gf.stunned', true)
        characterPlayAnim('gf', 'combo50', true)
        playedComboAnim = true
        runTimer('resetGFAnim', 2.7) -- mude isso se a animação durar mais ou menos tempo (change this if the animation takes longer or less time to complete)
    elseif combo == 200 and not playedComboAnim then
        setProperty('gf.stunned', true)
        characterPlayAnim('gf', 'combo200', true)
        playedComboAnim = true
        runTimer('resetGFAnim', 2.7) -- mude isso se a animação durar mais ou menos tempo (change this if the animation takes longer or less time to complete)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if lastCombo >= 10 then
        setProperty('gf.stunned', true)
        characterPlayAnim('gf', 'drop10', true)
        runTimer('resetGFAnim', 1.5) -- mude isso se a animação durar mais ou menos tempo (change this if the animation takes longer or less time to complete)
    end

    lastCombo = 0 -- zera após o erro
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resetGFAnim' then
        setProperty('gf.stunned', false)
        playedComboAnim = false
    end
end
