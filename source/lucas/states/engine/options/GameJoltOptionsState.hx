package lucas.gameJolt.states;

import ui.PsychUIInputText;
import ui.PsychUIButton;

class GameJoltOptionsState extends MusicBeatState
{
    var usernameInput:PsychUIInputText;
    var tokenInput:PsychUIInputText;
    var statusText:FlxText;

    override function create()
    {
        super.create();

        add(new FlxText(100, 50, 0, "GameJolt Login", 32));

        usernameInput = new PsychUIInputText(100, 100, 300, "Username");
        add(usernameInput);

        tokenInput = new PsychUIInputText(100, 150, 300, "Token");
        add(tokenInput);

        var loginBtn = new PsychUIButton(100, 200, "Login", onLogin);
        add(loginBtn);

        statusText = new PsychUIButton(100, 250, 0, "Status: Not logged in");
        add(statusText);
    }

    function onLogin()
    {
        var user = usernameInput.text;
        var token = tokenInput.text;

        FlxGameJolt.authUser(user, token, function(success:Bool)
        {
            if (success)
                statusText.text = "Status: Logged in as " + user;
            else
                statusText.text = "Login failed!";
        });
    }
}
