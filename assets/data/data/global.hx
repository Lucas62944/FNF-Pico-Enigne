var windowName = "Friday Night Funkin': Pico Engine";
window.title = windowName;

function postStateSwitch(){
    if(!Std.isOfType(FlxG.state, PlayState))
        window.title = windowName;
    else
        window.title = windowName + ' - ' + PlayState.SONG.meta.displayName;
}

function destroy(){
    window.title = "Friday Night Funkin': Pico Engine";
}

