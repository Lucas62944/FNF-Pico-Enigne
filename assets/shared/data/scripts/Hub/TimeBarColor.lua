--OG script By xdCallMeBOYFRIEND on gamebanana, Customized For 0.7.2h By Mrpolo.

dadColor = true; -- sets the timeBar Color to dad Health Color.
bfColor = false; -- sets the timeBar Color to boyfriend Health Color.
gfColor = false; -- se- wait who would even use this shi-

--[[ read cause yes.
so uhhh theres some bugs that i didnt know how to fix, like 
if you do true for both dad and bf it will show dad color,
if you do dad and gf it will do the same and if you do gf and bf it will show bf.

i know, im not good at programming yet, shut >:(
]]--

-----------------------------------------------------------------------------------------

function onUpdate()
    if dadColor == true and bfColor == true and gfColor == true then
	--yeah uhhhhhh idk what to put here.

    elseif dadColor == true then
        dadColR = getProperty('dad.healthColorArray[0]')
        dadColG = getProperty('dad.healthColorArray[1]')
        dadColB = getProperty('dad.healthColorArray[2]')
        dadColFinal = string.format('%02x%02x%02x', dadColR, dadColG, dadColB)
        setTimeBarColors(dadColFinal, "000000")
    elseif bfColor == true then
        bfColR = getProperty('boyfriend.healthColorArray[0]')
        bfColG = getProperty('boyfriend.healthColorArray[1]')
        bfColB = getProperty('boyfriend.healthColorArray[2]')
        bfColFinal = string.format('%02x%02x%02x', bfColR, bfColG, bfColB)
        setTimeBarColors(bfColFinal, "000000")
    elseif gfColor == true then
        gfColR = getProperty('gf.healthColorArray[0]')
        gfColG = getProperty('gf.healthColorArray[1]')
        gfColB = getProperty('gf.healthColorArray[2]')
        gfColFinal = string.format('%02x%02x%02x', gfColR, gfColG, gfColB)
        setTimeBarColors(gfColFinal, "000000")
    end
end

-----------------------------------------------------------------------------------------