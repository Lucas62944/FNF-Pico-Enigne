local darnell = 'weekend1/phillyStreets/spooky'
local greyShader = false -- não sei para que serve isso

function onCreate()
if greyShader then
makeLuaSprite('grey1' , darnell..'/greyGradient', 88, 1117);
scaleLuaSprite('grey1', 1, 1); 
addLuaSprite('grey1')
setScrollFactor('grey1', 1, 1);
setProperty('grey1.alpha', 0.3)

makeLuaSprite('grey2' , darnell..'/greyGradient', 88, 1117);
scaleLuaSprite('grey2', 1, 1); 
addLuaSprite('grey2')
setScrollFactor('grey2', 1, 1);
setProperty('grey2.alpha', 0.8)
end

if not lowQuality then
makeLuaSprite('Skybox' , darnell..'/phillySkybox', -545, -73);
scaleLuaSprite('Skybox', 1, 1); 
addLuaSprite('Skybox')
setScrollFactor('Skybox', 0.2, 0.2);

makeLuaSprite('Skyline' , darnell..'/phillySkyline', -545, -73);
scaleLuaSprite('Skyline', 1, 1); -- original 1
addLuaSprite('Skyline')
setScrollFactor('Skyline', 0.2, 0.2);

makeLuaSprite('ForegroundCity' , darnell..'/phillyForegroundCity', 600, 299);
scaleLuaSprite('ForegroundCity', 1, 1); 
addLuaSprite('ForegroundCity')
setScrollFactor('ForegroundCity', 0.3, 0.3);
end

makeLuaSprite('Construction' , darnell..'/phillyConstruction', 1795, -30);
scaleLuaSprite('Construction', 1, 1); 
addLuaSprite('Construction')
setScrollFactor('Construction', 0.7, 0.1);

if not lowQuality then
makeLuaSprite('HighwayLights' , darnell..'/phillyHighwayLights', 108, 1037);
scaleLuaSprite('HighwayLights', 1, 1); 
addLuaSprite('HighwayLights')
setScrollFactor('HighwayLights', 1, 1);
setBlendMode('HighwayLights','add')

makeLuaSprite('Highway' , darnell..'/phillyHighway', 88, 937);
scaleLuaSprite('Highway', 1, 1); -- original 1
addLuaSprite('Highway')
setScrollFactor('Highway', 1, 1);
end

makeLuaSprite('Smog' , darnell..'/phillySmog', 46, 985);
scaleLuaSprite('Smog', 1, 1); 
addLuaSprite('Smog')
setScrollFactor('Smog', 1, 1);

makeAnimatedLuaSprite('Cars', darnell..'/phillyCars', 1688, 1500)
addAnimationByPrefix('Cars', 'car', 'car1', 12, true)
scaleLuaSprite('Cars', 1, 1); 
addLuaSprite('Cars')
setScrollFactor('Cars', 1, 1);
setProperty('Cars.angle', -3)

makeAnimatedLuaSprite('molochCandleGlow', darnell..'/molochCandleGlow', 1210, 1360)
addAnimationByPrefix('molochCandleGlow', 'light', 'glowg', 24, true)
scaleLuaSprite('molochCandleGlow', 1.1, 1.1); 
addLuaSprite('molochCandleGlow', true)
setScrollFactor('molochCandleGlow', 1, 1);
setProperty('molochCandleGlow.alpha', 0.6)

makeLuaSprite('Foreground' , darnell..'/phillyForeground', 88, 1037);
scaleLuaSprite('Foreground', 1, 1);  -- original sem opt é 1
addLuaSprite('Foreground')
setScrollFactor('Foreground', 1, 1);

makeAnimatedLuaSprite('Traffic', darnell..'/phillyTraffic', 1888, 1337)
scaleLuaSprite('Traffic', 1, 1); 
addLuaSprite('Traffic')
setScrollFactor('Traffic', 1, 1);
posteNegativo()
runTimer('carro 1 andando', 5)

local x = 248
local y = 917
local scale = 1.4 -- original sem opt é 1.4

makeLuaSprite('mistMid' , darnell..'/fog', x, y);
scaleLuaSprite('mistMid', scale, scale); 
addLuaSprite('mistMid')
setProperty('mistMid.alpha', 0.6)
setBlendMode('mistMid','add')

makeLuaSprite('mistFront' , darnell..'/fog', x, y);
scaleLuaSprite('mistFront', scale, scale); 
addLuaSprite('mistFront', true)
setProperty('mistFront.alpha', 0.6)
setBlendMode('mistFront','add')
runTimer('mist1', 0.1)
end

function onTimerCompleted(timer)
if timer == 'mist1' then
setProperty('mistFront.velocity.x', -150)
setProperty('mistMid.velocity.x', 150)
setProperty('mistBack.velocity.x', -50)
runTimer('mist2', 2)
end
if timer == 'mist2' then
setProperty('mistFront.velocity.x', 150)
setProperty('mistMid.velocity.x', -150)
setProperty('mistBack.velocity.x', 50)
runTimer('mist1', 2)
end

if timer == 'carro 1 andando' then -- 1
carro1Andando()
addAnimationByPrefix('Cars', 'car', 'car1', 12, true)
postePositivo()
runTimer('carro 1 reset', 5)
end

if timer == 'carro 2 andando' then -- 2
carro1Andando()
addAnimationByPrefix('Cars', 'car', 'car2', 12, true)
runTimer('carro 2 reset', 5)
end

if timer == 'carro 3 andando' then -- 3
carro1Andando()
addAnimationByPrefix('Cars', 'car', 'car3', 12, true)
runTimer('carro 3 reset', 5)
end

if timer == 'carro 4 andando' then -- 4
carro1Andando()
addAnimationByPrefix('Cars', 'car', 'car4', 12, true)
runTimer('carro 4 reset', 5)
end

if timer == 'carro 1 reset' then -- reset 1
carro1Resetar()

runTimer('carro 2 andando', 3)
end

if timer == 'carro 2 reset' then -- reset 2
carro1Resetar()

runTimer('carro 3 andando', 5)
end

if timer == 'carro 3 reset' then -- reset 3
carro1Resetar()

runTimer('carro 4 andando', 5)
end

if timer == 'carro 4 reset' then -- reset 4 ao 1 novamente
carro1Resetar()
runTimer('carro 1 andando', 5)
end
end

function onUpdatePost()
setSpriteShader('dad', 'adjustColor')
setShaderFloat('dad', 'hue', -5)
setShaderFloat('dad', 'saturation', -40)
setShaderFloat('dad', 'contrast', -25)
setShaderFloat('dad', 'brightness', -25)

setSpriteShader('gf', 'adjustColor')
setShaderFloat('gf', 'hue', -5)
setShaderFloat('gf', 'saturation', -40)
setShaderFloat('gf', 'brightness', -15)

setSpriteShader('boyfriend', 'adjustColor')
setShaderFloat('boyfriend', 'hue', -5)
setShaderFloat('boyfriend', 'saturation', -40)
setShaderFloat('boyfriend', 'brightness', -25)
end

function onCreatePost()
if gfName == 'nene' then
nenePosition()
end
if gfName == 'gf' then
gfPosition()
end
if gfName == 'moloch' then
molochPosition()
end
if boyfriendName == 'spooky-playable' then
spookyPosition()
end
end

function nenePosition()
setProperty('gf.x', 1300)
setProperty('gf.y', 1130)
end

function gfPosition()
setProperty('gf.x', 1160)
setProperty('gf.y', 1156)
end

function molochPosition()
setProperty('gf.x', 1160)
setProperty('gf.y', 1056)
end

function spookyPosition()
setProperty('boyfriend.x', 1950)
setProperty('boyfriend.y', 1480)
end

function carro1Andando()
addAnimationByIndices('Traffic', 'color', 'greentored', 0, 24)
setProperty('Cars.velocity.x', 400)
setProperty('Cars.velocity.y', 50)
doTweenAngle('Cars', 'Cars', 10, 1, 'sineIn');
end

function posteNegativo()
addAnimationByPrefix('Traffic', 'color', 'redtogreen', 12, true)
addAnimationByIndices('Traffic', 'color', 'redtogreen', 1, 2, 3, 24)
end

function postePositivo()
addAnimationByPrefix('Traffic', 'color', 'greentored', 12, true)
addAnimationByIndices('Traffic', 'color', 'greentored', 1, 2, 3, 24)
end

function carro1Parado()
addAnimationByPrefix('Traffic', 'color', 'greentored', 12, true)
addAnimationByIndices('Traffic', 'color', 'greentored', 1, 2, 3, 24)
setProperty('Cars.velocity.x', 0)
setProperty('Cars.angle', -3)
setProperty('Cars.velocity.y', 0)
end

function carro1Resetar()
setProperty('Cars.x', 1188)
setProperty('Cars.y', 1500)
setProperty('Cars.angle', -3)
setProperty('Cars.velocity.x', 0)
setProperty('Cars.velocity.y', 0)
end

function onEvent(eventName, value1, value2) 
if eventName == 'Focus Camera' then
end
if value1 == '2' then
triggerEvent('Camera Follow Pos','1500','1500')
end

if value1 == '1' then
triggerEvent('Camera Follow Pos','1400','1600')
end

if value1 == '0' then
triggerEvent('Camera Follow Pos','1800','1750')
end

if eventName == 'Set Camera Zoom' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', value1, value2, 'cubeOut')
setProperty('defaultCamZoom', value1)
end

if value2 == '16' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', value1, 2, 'cubeOut')
setProperty('defaultCamZoom', value1)
end

if value2 == '18' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', value1, 2, 'cubeOut')
setProperty('defaultCamZoom', value1)
end

if value2 == '22' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', value1, 0.5, 'cubeOut')
setProperty('defaultCamZoom', value1)
end

if value2 == '32' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', value1, 2, 'cubeOut')
setProperty('defaultCamZoom', value1)
end

if value1 == '0.9' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', 0.7, value2, 'cubeOut')
setProperty('defaultCamZoom', 0.7)
end

if value1 == '1' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', 0.8, value2, 'cubeOut')
setProperty('defaultCamZoom', 0.8)
end

if value1 == '1.1' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', 0.9, value2, 'cubeOut')
setProperty('defaultCamZoom', 0.9)
end

if value1 == '1.2' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', 1, value2, 'cubeOut')
setProperty('defaultCamZoom', 1)
end

if value1 == '1.3' then
cancelTween("asf")
doTweenZoom('asf', 'camGame', 1.1, value2, 'cubeOut')
setProperty('defaultCamZoom', 1.1)
end
end