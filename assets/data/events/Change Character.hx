/**
 * CHANGELOG
 * 
 * Update 1.1:
 * - Better preloading
 * - To Preload Chars Use The File Called "PreloadChars.json" in "mods/[your mod]/config"
 * - Chart Characters are automatically preloaded no need to add them to the json
 * - Event icon in charter
 * - Character selection is a dropdown now
 */

import funkin.game.Character;
import funkin.backend.assets.Paths;
import funkin.backend.assets.ModsFolder;
import funkin.backend.scripting.events.EventGameEvent;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;

function postCreate()
{
    var json = Json.parse(FileSystem.exists("mods/" + ModsFolder.currentModFolder + "/config/PreloadChars.json") ? File.getContent("mods/" + ModsFolder.currentModFolder + "/config/PreloadChars.json") : '{}');
    var oldBF = boyfriend.curCharacter;
    var oldDad = dad.curCharacter;

    for (char in json.chars) {
        for (song in char.forSongs) {
            if (song.songName == state.SONG.meta.name) changeCharacter(char.isOpponent ? "dad": "bf", char.name, true);
        }
    }

    changeCharacter("bf", oldBF, false);
    changeCharacter("dad", oldDad, false);
}

function onEvent(e:EventGameEvent)
{
    if (e.event.name == "Change Character")
    {
        changeCharacter(e.event.params[0], e.event.params[1], false);
    }
}

function changeCharacter(oldchar, newchar, forPreloading)
{
    var thechar:Character = null;
    var graphic = null;
    switch (oldchar)
    {
        case "bf":
            thechar = boyfriend;
            state.remove(boyfriend);
            boyfriend = null;
            boyfriend = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
            state.add(boyfriend);
            changeIcon(iconP1, true, forPreloading);
            if (forPreloading)
            {
                graphic = boyfriend.graphic;
                graphic.useCount++;
                graphic.destroyOnNoUse = false;
                graphicCache.cachedGraphics.push(graphic);
                graphicCache.nonRenderedCachedGraphics.push(graphic);
            }

        case "dad":
            thechar = dad;
            state.remove(dad);
            dad = null;
            dad = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
            state.add(dad);
            changeIcon(iconP2, false, forPreloading);
            if (forPreloading)
            {
                graphic = dad.graphic;
                graphic.useCount++;
                graphic.destroyOnNoUse = false;
                graphicCache.cachedGraphics.push(graphic);
                graphicCache.nonRenderedCachedGraphics.push(graphic);
            }

    }
    if (!forPreloading) {
        var leftColor:Int = dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : 0xFFFF0000;
	    var rightColor:Int = boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : 0xFF66FF33;
        var colors = [leftColor, rightColor];
        healthBar.createFilledBar((state.opponentMode ? colors[1] : colors[0]), (state.opponentMode ? colors[0] : colors[1]));
        healthBar.updateBar();
    }
    if (forPreloading) trace("Chnage Character Event: Preloaded char \"" + newchar + "\" for song \"" + state.SONG.meta.name + "\"");
}

function changeIcon(icon, isPlayer, forPreloading)
{
    var char = (isPlayer ? boyfriend : dad).getIcon();
    var graphic = Paths.image("icons/" + char);
    if (icon.graphic != graphic) {
        icon.loadGraphic(graphic, true, 150, 150);
        if (forPreloading)
        {
            var icngraphic = icon.graphic;
             icngraphic.useCount++;
            icngraphic.destroyOnNoUse = false;
            graphicCache.cachedGraphics.push(icngraphic);
            graphicCache.nonRenderedCachedGraphics.push(icngraphic);
         }
        icon.animation.add(char, [for(i in 0...icon.frames.frames.length) i], 0, false, isPlayer);
	    icon.antialiasing = true;
	    icon.animation.play(char);
	    icon.setHealthSteps(icon.frames.frames.length >= 3 ? [[0, 1], [20, 0], [80, 2]] : [[0, 1], [20, 0]]);
    }
}