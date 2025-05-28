local offset = 0
local offset2 = 0
local moving = false
function goodNoteHit(i, d, t, s)
	if songName == 'Paranoia Leemix'
	or songName == 'Alone RAGMIX' then
	else
	if not s then
	offset = 2.5
	end
	if s then
		if offset <= 12.5 then
			offset = offset + 1.25
				if t == 'Note Shake'
				or t == 'Alt-Note Shake'
				or t == 'Note Shake (No Animation)'
    			or t == 'Trail Note Shake'
				or t == 'Trail Alt-Note Shake'
				or t == 'player 4 Note Shake'
				or t == 'player 4 Note Shake (No Animation)'
				or t == 'GF Note Shake'
				or t == 'GF Note Shake (No Animation)' then
					offset = offset + 3.75
				end
		end
	end
	if not moving then
		setPropertyFromGroup('strumLineNotes', d+4, 'y', 50-offset)
		noteTweenY('noteY'..d+4, d+4, 50, 2, 'expoOut')
	end
	if getPropertyFromGroup('strumLineNotes', d+4, 'downScroll') == true then
		if not moving then
			setPropertyFromGroup('strumLineNotes', d+4, 'y', 570+offset)
			noteTweenY('noteY'..d+4, d+4, 570, 2, 'expoOut')
		end
	end
	end
end
function opponentNoteHit(i, d, t, s)
	if songName == 'Paranoia Leemix' then
	else
	if not s then
	offset2 = 2.5
	end
	if s then
		if offset2 <= 12.5 then
			offset2 = offset2 + 1.25
				if t == 'Note Shake'
				or t == 'Alt-Note Shake'
				or t == 'Note Shake (No Animation)'
    			or t == 'Trail Note Shake'
				or t == 'Trail Alt-Note Shake'
				or t == 'player 4 Note Shake'
				or t == 'player 4 Note Shake (No Animation)'
				or t == 'GF Note Shake'
				or t == 'GF Note Shake (No Animation)' then
					offset2 = offset2 + 3.75
				end
		end
	end
	if not moving then
		setPropertyFromGroup('strumLineNotes', d, 'y', 50-offset2)
		noteTweenY('noteY'..d, d, 50, 2, 'expoOut')
	end
	if getPropertyFromGroup('strumLineNotes', d, 'downScroll') == true then
		if not moving then
			setPropertyFromGroup('strumLineNotes', d, 'y', 570+offset2)
			noteTweenY('noteY'..d, d, 570, 2, 'expoOut')
		end
	end
	end
end

function onStepHit()
if songName == 'Nourishing Blood' then
	if curStep == 640 then
		moving = true

		setPropertyFromGroup('strumLineNotes', d+4, 'y', 50-offset)
		noteTweenY('noteY'..d+4, d+4, 50, 2, 'expoOut')
		
		if getPropertyFromGroup('strumLineNotes', d+4, 'downScroll') == true then
				setPropertyFromGroup('strumLineNotes', d+4, 'y', 570+offset)
				noteTweenY('noteY'..d+4, d+4, 570, 2, 'expoOut')
		end
	end
	if curStep == 1456 then
		moving = false
	end
end
if songName == 'Starman Slaughter' then
	if curStep == 1084 then
		moving = true
	end
	if curStep == 1216 then
		moving = false
	end
end
end