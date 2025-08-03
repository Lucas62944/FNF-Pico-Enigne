function onNoteCreation(event)
{
    if (event.note.noteType == "Second BF Sing")
        return;

    if (event.note.strumLine == null || event.note.strumLine.characters == null || event.note.strumLine.characters[0] == null)
        return;
    var noteSprite = event.note.strumLine.characters[0].xml.get("notesprite");
    if (noteSprite != null)
        event.noteSprite = 'game/notes/' + noteSprite;
}

function create()
{
    muteVocalsOnMiss = false;
}

function onStrumCreation(event)
{
    var strumLine = strumLines.members[event.player];
    if (strumLine == null || strumLine.characters == null || strumLine.characters[0] == null)
    {
        trace('strumLine is NULL');
        return;
    }
    
    var noteSprite = strumLine.characters[0].xml.get("notesprite");
    if (noteSprite != null)
    {
        event.sprite = 'game/notes/' + noteSprite;
    }

    //trace(event.sprite);
}

function onNoteHit(_) {_.showRating = false;
}

function postCreate()
{
    for(s in strumLines.members[1]) {
        s.setGraphicSize(Std.int(160 * 0.66));
        s.y += 10;
    }
}

function onPlayerMiss()
{
    muteVocalsOnMiss = false;

    updateVocalsPitch(FlxG.random.float(0.85, 1.10));
    new FlxTimer().start(0.4, function(tmr:FlxTimer)
    {
        muteVocalsOnMiss = true;
        new FlxTimer().start(0.2, function(tmr:FlxTimer)
        {
            muteVocalsOnMiss = false;
        });
    });
}

function onPlayerHit(event)
{
    updateVocalsPitch(1);
}

function onDadHit(event)
{
    updateVocalsPitch(1);
}

function updateVocalsPitch(pitch:Float)
{
    if (vocals.pitch != (vocals.pitch = pitch))
    {
        resyncVocals();
    }
}