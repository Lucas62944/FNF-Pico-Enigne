lightningCooldown = 0

function onCreate()
	addCharacterToList('pico-playable', 'boyfriend')
	addCharacterToList('nene', 'girlfriend')
	addCharacterToList('spooky', 'dad')

	makeAnimatedLuaSprite('bgtrees', 'Stages/Erect/Week2/dark/bgtrees', 200, 100)
	luaSpriteAddAnimationByPrefix('bgtrees', 'bgtrees', 'bgtrees000', 5, true)
	luaSpritePlayAnimation('bgtrees', 'bgtrees')
	setObjectCamera('bgtrees', 'game')
	scaleLuaSprite('bgtrees', 1, 1)
	addLuaSprite('bgtrees', false)

	makeLuaSprite('bgDark', 'Stages/Erect/Week2/dark/bgDark', -400, -200)
	addLuaSprite('bgDark', false)
	scaleObject('bgDark', 1, 1)

	makeLuaSprite('bgLight', 'Stages/Erect/Week2/dark/bgLight', -400, -200)
	addLuaSprite('bgLight', false)
	scaleObject('bgLight', 1, 1)
	setProperty('bgLight.alpha', 0)

	makeLuaSprite('stairsDark', 'Stages/Erect/Week2/dark/stairsDark', 800, -200)
	addLuaSprite('stairsDark', false)
	scaleObject('stairsDark', 1, 1)

	makeLuaSprite('stairsLight', 'Stages/Erect/Week2/dark/stairsLight', 800, -200)
	addLuaSprite('stairsLight', false)
	scaleObject('stairsLight', 1, 1)
	setProperty('stairsLight.alpha', 0)
end

function randomLightning()
	local wichSound = getRandomInt(0, 2)
	if wichSound == 0 then
		playSound('Engine/Lightning1', 0.3, 'Lightning1')
	elseif wichSound == 1 then
		playSound('Engine/Lightning2', 0.3, 'Lightning2')
	elseif wichSound == 2 then
		playSound('Engine/Lightning3', 0.3, 'Lightning3')
	end
	lightningCooldown = 2
end

function lightningEffect()
	if lightningCooldown <= 0 then
		setProperty('bgLight.alpha', 1)
		setProperty('stairsLight.alpha', 1)
		doTweenAlpha('bgLightTweenAlpha', 'bgLight', 0, 1, 'circInOut')
		doTweenAlpha('stairsLightTweenAlpha', 'stairsLight', 0, 1, 'circInOut')
		
if songName == 'Spookeez-Darnell-Mix' then
	triggerEvent('Change Character', 'bf', 'darnell-Playable')

	elseif songName == 'Spookeez-Pico' then
	triggerEvent('Change Character', 'bf', 'pico-playable')
end
		triggerEvent('Change Character', 'dad', 'spooky')
		triggerEvent('Change Character', 'gf', 'nene')
		triggerEvent('Play Animation', 'scared', 'girlfriend')
		triggerEvent('Noteskin-Change1', 'bf', 'noteSkins/NOTE_assets')
		triggerEvent('Noteskin-Change2', 'dad', 'noteSkins/NOTE_assets')
		doTweenAlpha('BFTweenAlpha', 'boyfriend', 0, 0.8, 'linear')
		doTweenAlpha('DADTweenAlpha', 'dad', 0, 0.8, 'linear')
		doTweenAlpha('GFTweenAlpha', 'gf', 0, 0.8, 'linear')
		runTimer('lightTime', 0.75)
		randomLightning()
	end
end

function onUpdate(elapsed)
	lightningCooldown = lightningCooldown - elapsed
	local curStep = getProperty('curStep')
	if getPropertyFromClass("flixel.FlxG","keys.justPressed.SPACE") then
		--lightningEffect()
	end
	handleLightning(curStep)
end

function handleLightning(curStep)
	local startSteps = {15, 115, 215, 315, 415, 515, 615, 715, 815}
	for _, step in ipairs(startSteps) do
		if curStep == step then
			lightningEffect()
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'lightTime' then
		setProperty('boyfriend.alpha', 1)
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)

if songName == 'Spookeez-Darnell-Mix' then
	triggerEvent('Change Character', 'bf', 'darnell-dark')
	
	elseif songName == 'Spookeez-Pico' then
	triggerEvent('Change Character', 'bf', 'pico-dark')
end
		triggerEvent('Change Character', 'dad', 'spooky-dark')
		triggerEvent('Change Character', 'gf', 'nene-dark')
		triggerEvent('Noteskin-Change1', 'bf', 'noteSkins/Chart/Dark-Notes')
		triggerEvent('Noteskin-Change2', 'dad', 'noteSkins/Chart/Dark-Notes')
	end
end
