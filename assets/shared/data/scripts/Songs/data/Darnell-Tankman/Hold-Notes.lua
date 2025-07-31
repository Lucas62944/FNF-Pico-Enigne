local holdNote1_disappear = 0
local holdNote2_disappear = 0
local holdNote3_disappear = 0
local holdNote4_disappear = 0

local makeNoteInvisible = 24

local pixelStage = {'school', 'schoolEvil'}

function onCreate()
    setProperty('noteSplashData.useGlobalShader', true)

    for i = 1, #pixelStage do
        if curStage == pixelStage[i] then
           close(true);
        end
    end

    makeAnimatedLuaSprite('holdNote1', 'noteSplashes/holdNote/Chart/Tankman', 0, 0)
    addAnimationByPrefix('holdNote1', 'purpleCoverStart', 'purpleCover0', 24, true)
    addAnimationByPrefix('holdNote1', '"purpleCoverEnd', 'holdCoverEnd0', 24, false)
    addLuaSprite('holdNote1', true)
    setObjectCamera('holdNote1', 'hud')

    makeAnimatedLuaSprite('holdNote2', 'noteSplashes/holdNote/Chart/Tankman', 0, 0)
    addAnimationByPrefix('holdNote2', 'holdNote_Loop', 'holdCover0', 24, true)
    addAnimationByPrefix('holdNote2', 'holdNote_End', 'holdCoverEnd0', 24, false)
    addLuaSprite('holdNote2', true)
    setObjectCamera('holdNote2', 'hud')

    makeAnimatedLuaSprite('holdNote3', 'noteSplashes/holdNote/Chart/Tankman', 0, 0)
    addAnimationByPrefix('holdNote3', 'holdNote_Loop', 'holdCover0', 24, true)
    addAnimationByPrefix('holdNote3', 'holdNote_End', 'holdCoverEnd0', 24, false)
    addLuaSprite('holdNote3', true)
    setObjectCamera('holdNote3', 'hud')

    makeAnimatedLuaSprite('holdNote4', 'noteSplashes/holdNote/Chart/Tankman', 0, 0)
    addAnimationByPrefix('holdNote4', 'holdNote_Loop', 'holdCover0', 24, true)
    addAnimationByPrefix('holdNote4', 'holdNote_End', 'holdCoverEnd0', 24, false)
    addLuaSprite('holdNote4', true)
    setObjectCamera('holdNote4', 'hud')

    setProperty('holdNote1.visible', false)
    setProperty('holdNote2.visible', false)
    setProperty('holdNote3.visible', false)
    setProperty('holdNote4.visible', false)
end

function onUpdate()
    setObjectOrder('holdNote1', 99)
    setObjectOrder('holdNote2', 99)
    setObjectOrder('holdNote3', 99)
    setObjectOrder('holdNote4', 99)

    setProperty('holdNote1.x', defaultPlayerStrumX0 - 110)
    setProperty('holdNote1.y', defaultPlayerStrumY0 - 100)

    setProperty('holdNote2.x', defaultPlayerStrumX1 - 110)
    setProperty('holdNote2.y', defaultPlayerStrumY1 - 100)

    setProperty('holdNote3.x', defaultPlayerStrumX2 - 110)
    setProperty('holdNote3.y', defaultPlayerStrumY2 - 100)

    setProperty('holdNote4.x', defaultPlayerStrumX3 - 110)
    setProperty('holdNote4.y', defaultPlayerStrumY3 - 100)

    holdNote1_disappear = holdNote1_disappear + 1
    holdNote2_disappear = holdNote2_disappear + 1
    holdNote3_disappear = holdNote3_disappear + 1
    holdNote4_disappear = holdNote4_disappear + 1

    if holdNote1_disappear >= makeNoteInvisible then
        setProperty('holdNote1.visible', false)
    end
    if holdNote1_disappear >= 4 then
        objectPlayAnimation('holdNote1', 'holdNote_End')
    end

    if holdNote2_disappear >= makeNoteInvisible then
        setProperty('holdNote2.visible', false)
    end
    if holdNote2_disappear >= 4 then
        objectPlayAnimation('holdNote2', 'holdNote_End')
    end

    if holdNote3_disappear >= makeNoteInvisible then
        setProperty('holdNote3.visible', false)
    end
    if holdNote3_disappear >= 4 then
        objectPlayAnimation('holdNote3', 'holdNote_End')
    end

    if holdNote4_disappear >= makeNoteInvisible then
        setProperty('holdNote4.visible', false)
    end
    if holdNote4_disappear >= 4 then
        objectPlayAnimation('holdNote4', 'holdNote_End')
    end

end

function goodNoteHitPre(id, direction, noteType, isSustainNote)
    if direction == 0 and isSustainNote then
        holdNote1_disappear = 0
        setProperty('holdNote1.visible', true)
        objectPlayAnimation('holdNote1', 'holdNote_Loop')
    end

    if direction == 1 and isSustainNote then
        holdNote2_disappear = 0
        setProperty('holdNote2.visible', true)
        objectPlayAnimation('holdNote2', 'holdNote_Loop')
    end

    if direction == 2 and isSustainNote then
        holdNote3_disappear = 0
        setProperty('holdNote3.visible', true)
        objectPlayAnimation('holdNote3', 'holdNote_Loop')
    end

    if direction == 3 and isSustainNote then
        holdNote4_disappear = 0
        setProperty('holdNote4.visible', true)
        objectPlayAnimation('holdNote4', 'holdNote_Loop')
    end
end