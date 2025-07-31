---@diagnostic disable: lowercase-global, undefined-global
-- Lua intellisense is dumb lol

--[[
    Version: 1.2.1
    Author: Ralsi (https://gamebanana.com/members/1939328)
    GB Page: https://gamebanana.com/tools/12022
    Crediting: If used in a mod, crediting is not necessary but very much appreciated. Do not remove or edit all this info tho.
--]]


--[[
    CHANGEABLE VARIABLES

    Try out setGlobalFromScript('luaFile','global',val) if you want, I didn't test it lol 🤓
--]]

-- toggles the timer on player strums
local showPlayer = true
-- toggles the timer on opponent strums
local showOpponent = false

offsetXPlr = 0
offsetYPlr = 120
offsetXOpp = 0
offsetYOpp = 120
-- Minimum time in milliseconds required to start showing the timer, useful for showing the timer only on parts with longer wait than usual.
treshholdPlr = 1000
treshholdOpp = 1000
-- Prevents the timer to move along X axis.
lockXPlr = false
lockXOpp = false
-- Prevents the timer to move along Y axis.
lockYPlr = false
lockYOpp = false
-- Moving the timer with strums, uses interpolation.
sharesStrumsPositionPlr = true
sharesStrumsPositionOpp = true
-- The speed of timer movement, used in interpolation.
moveSpeed = 12
-- Size of the timer's text
local textSize = 26

-- [[ CODE ]] --
local songStarted = false
local songPos = 0
local nearestNoteTimePlr = 0
local nearestNoteTimePlrConst = 0
local nearestNoteTimeOpp = 0
local nearestNoteTimeOppConst = 0
local TimerDotVisiblePlr = false
local TimerDotVisibleOpp = false
local noteSoonPlr = false
local noteSoonOpp = false
local posX, posY = 0, 0
local oposX, oposY = 0, 0
local down = false
local WDYMTheresNoNotesPlr = false
local WDYMTheresNoNotesOpp = false

local function getNearestNoteTime(opponent)
    for i = 0, getProperty('notes.length') - 1 do -- checking if we already have one
        local notePress = getPropertyFromGroup('notes', i, 'mustPress')
        if opponent and not notePress then
            local TIMEEE = getPropertyFromGroup('notes', i, 'strumTime')
            if TIMEEE - songPos < 2000 then noteSoonOpp = true end
            return TIMEEE
        elseif not opponent and notePress then
            local TIMEEE = getPropertyFromGroup('notes', i, 'strumTime')
            if TIMEEE - songPos < 2000 then noteSoonPlr = true end
            return TIMEEE
        end
    end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        local notePress = getPropertyFromGroup('unspawnNotes', i, 'mustPress')
        if opponent and not notePress then
            noteSoonOpp = false
            return getPropertyFromGroup('unspawnNotes', i, 'strumTime')
        elseif not opponent and notePress then
            noteSoonPlr = false
            return getPropertyFromGroup('unspawnNotes', i, 'strumTime')
        end
    end
    if opponent then WDYMTheresNoNotesOpp = true else WDYMTheresNoNotesPlr = true end
    print('No way theres no notes 💀')
end

local function intoTimeString(ms, addZero)
    local sec, min = math.floor(ms / 1000) % 60, math.floor(ms / 60000)
    local strSec, strMin = tostring(sec), tostring(min)
    return string.format('%s:%s', addZero and min < 10 and '0' .. strMin or strMin, sec < 10 and '0' .. strSec or strSec)
end

local function lerp(s, e, t)
    return s + (e - s) * t
end

local function getStrumsMiddle(opponent)
    local np1x, np2x, np3x, np4x, np1y, np2y, np3y, np4y
    if opponent then
        np1x, np2x, np3x, np4x = getPropertyFromGroup('opponentStrums', 0, 'x'),
            getPropertyFromGroup('opponentStrums', 1, 'x'),
            getPropertyFromGroup('opponentStrums', 2, 'x'),
            getPropertyFromGroup('opponentStrums', 3, 'x')
        np1y, np2y, np3y, np4y = getPropertyFromGroup('opponentStrums', 0, 'y'),
            getPropertyFromGroup('opponentStrums', 1, 'y'),
            getPropertyFromGroup('opponentStrums', 2, 'y'),
            getPropertyFromGroup('opponentStrums', 3, 'y')
    else
        np1x, np2x, np3x, np4x = getPropertyFromGroup('playerStrums', 0, 'x'),
            getPropertyFromGroup('playerStrums', 1, 'x'),
            getPropertyFromGroup('playerStrums', 2, 'x'),
            getPropertyFromGroup('playerStrums', 3, 'x')
        np1y, np2y, np3y, np4y = getPropertyFromGroup('playerStrums', 0, 'y'),
            getPropertyFromGroup('playerStrums', 1, 'y'),
            getPropertyFromGroup('playerStrums', 2, 'y'),
            getPropertyFromGroup('playerStrums', 3, 'y')
    end

    return (np1x + np2x + np3x + np4x) / 4, (np1y + np2y + np3y + np4y) / 4
end

function onCreatePost()
    down = downscroll
    if showOpponent then
        oposX, oposY = getStrumsMiddle(true)
        makeLuaText('TurnTimerOpponent', '', 100, oposX + offsetXOpp, down and oposX - offsetYOpp or oposY + offsetYOpp)
        setTextAlignment('TurnTimerOpponent', 'center')
        setTextSize('TurnTimerOpponent', textSize)
        addLuaText('TurnTimerOpponent')
    end
    if showPlayer then
        posX, posY = getStrumsMiddle()
        makeLuaText('TurnTimerPlayer', '', 100, posX + offsetXPlr, down and posX - offsetYPlr or posY + offsetYPlr)
        setTextAlignment('TurnTimerPlayer', 'center')
        setTextSize('TurnTimerPlayer', textSize)
        addLuaText('TurnTimerPlayer')
    end
end

function onSongStart()
    songStarted = true
end

function onUpdatePost(delta)
    if not songStarted then return end
    songPos = getSongPosition()
    if showPlayer then
        local sillyNotePosPlr = nearestNoteTimePlr - songPos
        if sillyNotePosPlr < 1 and not WDYMTheresNoNotesPlr then
            nearestNoteTimePlr = getNearestNoteTime()
            nearestNoteTimePlrConst = nearestNoteTimePlr - songPos
        end
        if not noteSoonPlr and nearestNoteTimePlrConst > treshholdPlr and sillyNotePosPlr > 1000 then
            if not TimerDotVisiblePlr then TimerDotVisiblePlr = true end
            setTextString('TurnTimerPlayer', intoTimeString(sillyNotePosPlr, true))
        elseif TimerDotVisiblePlr then
            TimerDotVisiblePlr = false
            setTextString('TurnTimerPlayer', '')
        end
        if sharesStrumsPositionPlr then
            local posXend, posYend = getStrumsMiddle()
            if not lockX then
                posX = lerp(posX, posXend, delta * moveSpeed)
                setProperty('TurnTimerPlayer.x', posX + offsetXPlr)
            end
            if not lockY then
                posY = lerp(posY, posYend, delta * moveSpeed)
                setProperty('TurnTimerPlayer.y', down and posY - offsetYPlr / 3 or posY + offsetYPlr)
            end
        end
    end
    if showOpponent then
        local sillyNotePosOpp = nearestNoteTimeOpp - songPos
        if sillyNotePosOpp < 1 and not WDYMTheresNoNotesOpp then
            nearestNoteTimeOpp = getNearestNoteTime(true)
            nearestNoteTimeOppConst = nearestNoteTimeOpp - songPos
        end
        if not noteSoonOpp and nearestNoteTimeOppConst > treshholdOpp and sillyNotePosOpp > 1000 then
            if not TimerDotVisibleOpp then TimerDotVisibleOpp = true end
            setTextString('TurnTimerOpponent', intoTimeString(sillyNotePosOpp, true))
        elseif TimerDotVisibleOpp then
            TimerDotVisibleOpp = false
            setTextString('TurnTimerOpponent', '')
        end

        if sharesStrumsPositionOpp then
            local oposXend, oposYend = getStrumsMiddle(true)
            if not lockX then
                oposX = lerp(oposX, oposXend, delta * moveSpeed)
                setProperty('TurnTimerOpponent.x', oposX + offsetXOpp)
            end
            if not lockY then
                oposY = lerp(oposY, oposYend, delta * moveSpeed)
                setProperty('TurnTimerOpponent.y', down and oposY - offsetYOpp / 3 or oposY + offsetYOpp)
            end
        end
    end
end
