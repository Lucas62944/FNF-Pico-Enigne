-- Script by Shartize
-- long splash system by shartize

local holdofsets = {
    hold = {x=-110,y=-93},
    holdend = {x=-112,y=-93}
};
local holdfolders = "Hold Cover/Arrow Funk/holdCover"
local notedatas = {"Purple","Blue","Green","Red"};
function onCreatePost()
    for i = 1,#holdfolders do
        makeAnimatedLuaSprite("holdCoverEnd"..notedatas[i], holdfolders..notedatas[i], -2000,-2000)
        addLuaSprite("holdCoverEnd"..notedatas[i], true)
        setObjectCamera("holdCoverEnd"..notedatas[i], 'camHUD')
        addAnimationByPrefix("holdCoverEnd"..notedatas[i], "holdend", "holdCoverEnd"..notedatas[i], 24, false)
        playAnim("holdCoverEnd"..notedatas[i], "holdend", true);
    end

    if songName == 'Splatter' then
        holdofsets = {
            hold = {x=-0,y=-103},
            holdend = {x=-2,y=-103}
        };
    else
        holdofsets = {
            hold = {x=-110,y=-93},
            holdend = {x=-112,y=-93}
        };
    end
end
local visiblehold = {false,false,false,false}
local oppovisiblehold = {false,false,false,false}
local presskey = {"left","down","up","right"}
function onUpdatePost(elapsed)
    for i = 1,#presskey do
        if keyReleased(presskey[i]) then
            visiblehold[i] = false;
            setProperty("holdCover"..notedatas[i]..".visible", false)

            
        end
    end
    for i = 1,4 do
        --debugPrint(getProperty("holdCoverEnd"..notedatas[i]..".animation.curAnim.paused"))
        if getProperty("holdCoverEnd"..notedatas[i]..'.animation.curAnim.finished') then
            setProperty("holdCoverEnd"..notedatas[i]..".visible", false)
        end
    end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote == true then
        --triggerEvent('Play Animation',0,'sing'.. directions[direction + 1] .. '-sus')
        
        --runTimer('dad animations', crochet/1000, 1)
        --dadanim = directions[direction + 1];
        local ofsets = {
            x = getPropertyFromGroup('playerStrums',direction,'x'),
            y = getPropertyFromGroup('playerStrums',direction,'y'),
        };
        --debugPrint(ofsets.x+holdofsets.hold.x.."aaaaaa"..ofsets.y+holdofsets.hold.y+300)
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') and isSustainNote then
            --debugPrint('sus-end')
            --characterPlayAnim('dad', 'sing'.. directions[direction + 1] .. '-sus-end', true)
            visiblehold[direction+1] = false;
            setProperty("holdCover"..notedatas[direction+1]..".visible", false)

            makeAnimatedLuaSprite("holdCoverEnd"..notedatas[direction+1], holdfolders..notedatas[direction+1], ofsets.x+holdofsets.holdend.x, ofsets.y+holdofsets.holdend.y)
            addLuaSprite("holdCoverEnd"..notedatas[direction+1], true)
            setObjectCamera("holdCoverEnd"..notedatas[direction+1], 'camHUD')
            addAnimationByPrefix("holdCoverEnd"..notedatas[direction+1], "holdend", "holdCoverEnd"..notedatas[direction+1], 24, false)
            playAnim("holdCoverEnd"..notedatas[direction+1], "holdend", true);

            setProperty("holdCoverEnd"..notedatas[direction+1]..".visible", true)

            setPropertyFromGroup('notes', id, 'visible',false)
        else
            --debugPrint('sus')
            --characterPlayAnim('dad', 'sing'.. directions[direction + 1] .. '-sus', true)
            if visiblehold[direction+1] == false then
                visiblehold[direction+1] = true;
                makeAnimatedLuaSprite("holdCover"..notedatas[direction+1], holdfolders..notedatas[direction+1], ofsets.x+holdofsets.hold.x, ofsets.y+holdofsets.hold.y)
                setObjectCamera("holdCover"..notedatas[direction+1], 'camHUD')
                addLuaSprite("holdCover"..notedatas[direction+1], true)
                addAnimationByPrefix("holdCover"..notedatas[direction+1], "hold", "holdCover"..notedatas[direction+1], 24, true)
                playAnim("holdCover"..notedatas[direction+1], "hold", true);
                
                setProperty("holdCover"..notedatas[direction+1]..".visible", true)
            end
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote == true then
        --triggerEvent('Play Animation',0,'sing'.. directions[direction + 1] .. '-sus')
        
        --runTimer('dad animations', crochet/1000, 1)
        --dadanim = directions[direction + 1];
        local ofsets = {
            x = getPropertyFromGroup('opponentStrums',direction,'x'),
            y = getPropertyFromGroup('opponentStrums',direction,'y'),
        };
        --debugPrint(ofsets.x+holdofsets.hold.x.."aaaaaa"..ofsets.y+holdofsets.hold.y+300)
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') and isSustainNote then
            --debugPrint('sus-end')
            --characterPlayAnim('dad', 'sing'.. directions[direction + 1] .. '-sus-end', true)
            oppovisiblehold[direction+1] = false;
            setProperty("OppoholdCover"..notedatas[direction+1]..".visible", false)

            setPropertyFromGroup('notes', id, 'visible',false)
        else
            --debugPrint('sus')
            --characterPlayAnim('dad', 'sing'.. directions[direction + 1] .. '-sus', true)
            if oppovisiblehold[direction+1] == false then
                oppovisiblehold[direction+1] = true;
                makeAnimatedLuaSprite("OppoholdCover"..notedatas[direction+1], holdfolders..notedatas[direction+1], ofsets.x+holdofsets.hold.x, ofsets.y+holdofsets.hold.y)
                setObjectCamera("OppoholdCover"..notedatas[direction+1], 'camHUD')
                addLuaSprite("OppoholdCover"..notedatas[direction+1], true)
                addAnimationByPrefix("OppoholdCover"..notedatas[direction+1], "hold", "holdCover"..notedatas[direction+1], 24, true)
                playAnim("OppoholdCover"..notedatas[direction+1], "hold", true);
                
                setProperty("OppoholdCover"..notedatas[direction+1]..".visible", true)
            end
        end
    end
end