-- made by tafihalikom1.
function onCountdownStarted()
    local songName = 'Ruckus-(Pico-Mix)' -- what's gonna be displayed in the first line
    local songComposer = 'Composer: Skellixs' -- what's gonna be displayed in the second line
    local charter = 'Charter: Skellixs' -- what's gonna be displayed in the third line
    local extraText = 'Pico-Engine: Lucas' -- what's gonna be displayed in the fourth line.


    -- background border shit
    makeLuaSprite('background', '', 0, 210)
	makeGraphic('background', 1, 1, '000000')
    scaleObject('background', 580, 130) -- change x or y values if needed
	setObjectCamera('background', 'other')
	addLuaSprite('background', false)
	setProperty('background.alpha', 0)

    -- text shit
    makeLuaText('songname', songName, 1250, 5, 225)
    setTextAlignment('songname', 'left')
    addLuaText('songname')
    setTextSize('songname', 22)
    setProperty('songname.alpha', 0)
    setObjectCamera('songname', 'other')

    makeLuaText('songby', songComposer, 1250, 5, 251)
    setTextAlignment('songby', 'left')
    addLuaText('songby')
    setTextSize('songby', 22)
    setProperty('songby.alpha', 0)
    setObjectCamera('songby', 'other')

    makeLuaText('chartby', charter, 1250, 5, 275)
    setTextAlignment('chartby', 'left')
    addLuaText('chartby')
    setTextSize('chartby', 22)
    setProperty('chartby.alpha', 0)
    setObjectCamera('chartby', 'other')

    makeLuaText('extraShit', extraText, 1250, 5, 300)
    setTextAlignment('extraShit', 'left')
    addLuaText('extraShit')
    setTextSize('extraShit', 22)
    setProperty('extraShit.alpha', 0)
    setObjectCamera('extraShit', 'other')

    --fade in logic + run timer for fade out
    -- tween alpha
    doTweenAlpha('background', 'background', 0.72, 2, 'sineInOut')
    doTweenAlpha('songname', 'songname', 1, 2, 'sineInOut')
    doTweenAlpha('songby', 'songby', 1, 2, 'sineInOut')
    doTweenAlpha('chartby', 'chartby', 1, 2, 'sineInOut')
    doTweenAlpha('extraShit', 'extraShit', 1, 2, 'sineInOut')
    --run timer
    runTimer('timeUntilGtfo', 3)
    runTimer('remove', 5)
end
function onTimerCompleted(tag)
    if tag == 'timeUntilGtfo' then
        doTweenAlpha('background', 'background', 0, 2, 'sineInOut')
        doTweenAlpha('songname', 'songname', 0, 2, 'sineInOut')
        doTweenAlpha('songby', 'songby', 0, 2, 'sineInOut')
        doTweenAlpha('chartby', 'chartby', 0, 2, 'sineInOut')
        doTweenAlpha('extraShit', 'extraShit', 0, 2, 'sineInOut')
    end
    if tag == 'remove' then
        removeLuaSprite('background', true)
        removeLuaText('songname', true)
        removeLuaText('songby', true)
        removeLuaText('chartby', true)
        removeLuaText('extraShit', true)
    end
end