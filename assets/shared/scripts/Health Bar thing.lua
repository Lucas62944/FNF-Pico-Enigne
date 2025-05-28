-- Icon Section
local iconsEdge = true -- if it is set to true,the icons will go to the edge of the healthbar
local iconsOTB = false -- (OTB: Off the healthbar) makes the iconP BF go to the right snd icon Opponent go to the left
local iconSwing = false -- this makes the icon rotate
local angleValue = 20 -- original value:20
local ease = 'easeInOut'

-- Movement thing
local Movement = "Middle" -- Set this to the Left, Middle or Right make the icons and the healthbar move either to the left, middle or right

function onUpdatePost()
if iconsOTB then
setProperty('iconP1.x', 1115)
setProperty('iconP2.x', 5)
setProperty('healthBar.x', 343.5)
end

if Movement == "Left" then
setProperty('healthBar.x', 40)
if iconsEdge then
setProperty('iconP1.x', 555)
setProperty('iconP2.x', -20)
end
end

if Movement == "Middle" then
if iconsEdge then
setProperty('iconP1.x', 840)
setProperty('iconP2.x', 260)
end
end

if Movement == "Right" then
setProperty('healthBar.x', 590)
if iconsEdge then
setProperty('iconP1.x', 1115)
setProperty('iconP2.x', 520)
end
end
end

function noteMiss()
setProperty('iconP1.color', getColorFromHex('6B00A9'))
doTweenColor('Change Icon Color', 'iconP1', 'FFFFFF', 0.25/playbackRate, 'linear')
end

function onSongStart()
if iconSwing then
setProperty('iconP1.angle', angleValue)
setProperty('iconP2.angle', -angleValue)
doTweenAngle('Icon Angle', 'iconP1', 0, crochet/1000/playbackRate, ease)
doTweenAngle('Icon Angle 2', 'iconP2', 0, crochet/1000/playbackRate, ease)
end
end

function onBeatHit()
angleValue = -20
if curBeat %2 == 0 then
angleValue = 20
end

if iconSwing then
setProperty('iconP1.angle', angleValue)
setProperty('iconP2.angle', -angleValue)

doTweenAngle('Icon Angle', 'iconP1', 0, crochet/1000/playbackRate, ease)
doTweenAngle('Icon Angle 2', 'iconP2', 0, crochet/1000/playbackRate, ease)
end
end