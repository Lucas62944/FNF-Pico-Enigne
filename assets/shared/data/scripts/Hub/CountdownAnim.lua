function onCountdownTick(swagCounter)
    if swagCounter == 0 then
        playAnim('boyfriend', '3', true)
    elseif swagCounter == 1 then
        playAnim('boyfriend', '2', true)
    elseif swagCounter == 2 then
        playAnim('boyfriend', '1', true)
    elseif swagCounter == 3 then
        if hasAnimation('boyfriend', 'hey') then
            playAnim('boyfriend', 'hey', true)
        else
            playAnim('boyfriend', 'singUP', true)
        end
    end

    if swagCounter == 0 then
        playAnim('gf', '3', true)
    elseif swagCounter == 1 then
        playAnim('gf', '2', true)
    elseif swagCounter == 2 then
        playAnim('gf', '1', true)
    elseif swagCounter == 3 then
        if hasAnimation('gf', 'cheer') then
            playAnim('gf', 'cheer', true)
        else
            playAnim('gf', 'singUP', true)
        end
    end

    if swagCounter == 0 then
        playAnim('dad', '3', true)
    elseif swagCounter == 1 then
        playAnim('dad', '2', true)
    elseif swagCounter == 2 then
        playAnim('dad', '1', true)
    elseif swagCounter == 3 then
        if hasAnimation('dad', 'hey') then
            playAnim('dad', 'hey', true)
        else
            playAnim('dad', 'singUP', true)
        end
    end
end
