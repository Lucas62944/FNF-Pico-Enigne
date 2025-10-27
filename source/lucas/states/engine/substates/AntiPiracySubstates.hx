#if PIRATE_ALLOWED
package lucas.states.engine.substates;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import states.TitleState;
#end

class AntiPiracyState extends FlxState
{
    var stage:Int = 0;
    var text:FlxText;

    override public function create():Void
    {
        super.create();

        // ALLOWED system
        var ALLOWED:Bool = isUserAllowed();

        // If allowed, go to TitleState (menu) without blocking
        if (ALLOWED)
        {
            FlxG.switchState(new TitleState()); // or MainMenuState depending on your structure
            return;
        }

        // Otherwise, show piracy warning
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(bg);

        text = new FlxText(0, FlxG.height / 2 - 50, FlxG.width,
            "PIRATED COPY DETECTED\n\nLoading warning...");
        text.setFormat(null, 24, FlxColor.RED, "center");
        add(text);

        new FlxTimer().start(2, showDialog);
    }

    function showDialog(timer:FlxTimer)
    {
        switch (stage)
        {
            case 0:
                text.text = "Hello player.\n\nWe detected that this is not the official version of the mod.";
                stage++;
                new FlxTimer().start(3, showDialog);
            case 1:
                text.text = "Please consider downloading the official version\n to support the creators and have the best experience.";
                stage++;
                new FlxTimer().start(4, showDialog);
            case 2:
                text.text = "You will be redirected soon.\nThank you for understanding.";
                stage++;
                new FlxTimer().start(3, showDialog);
            case 3:
                Sys.exit(0); // Closes the game
        }
    }

    function isUserAllowed():Bool
    {
        // Example allowed users list
        var allowedUsers:Array<String> = ["Lucas"];
        var currentUser:String = getCurrentUser();

        // If currentUser is in allowedUsers, return true
        return allowedUsers.contains(currentUser);
    }

    function getCurrentUser():String
    {
        // Example: get Windows username
        return Sys.getEnv("Lucas");

        // If using your own login system, replace with:
        // return MyUserManager.loggedUser;
    }
}
