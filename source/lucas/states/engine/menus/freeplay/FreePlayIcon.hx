package lucas.states.menus.freeplay;

import flixel.FlxSprite;
import Paths;

class FreePlayIcon extends FlxSprite
{
    public function new(x:Float = 0, y:Float = 0, character:String = 'bf')
    {
        super(x, y);

        // Define o caminho do icon
        var path:String = 'icons/FreePlay/' + png;

        // Verifica se existe e carrega o atlas
        if (Paths.fileExists('images/' + path + '.png', IMAGE))
        {
            this.frames = Paths.getSparrowAtlas(path);

            animation.addByPrefix('idle', character + ' idle', 24, true);
            animation.addByPrefix('confirm', character + ' confirm', 24, true);
            animation.addByPrefix('confirm-hold', character + ' confirm-hold', 24, true);

            animation.play('idle');
            updateHitbox();
        }
        else
        {
            trace('FreePlayIcon: Icon not found for character: ' + character);
        }
    }

    public function playConfirm():Void
    {
        if (animation.getByName('confirm') != null)
            animation.play('confirm');
    }

    public function playIdle():Void
    {
        if (animation.getByName('idle') != null)
            animation.play('idle');
    }

    public function playConfirmHold():Void
    {
        if (animation.getByName('confirm-hold') != null)
            animation.play('confirm-hold');
    }
}
