package lucas.stages.standard;

import flixel.FlxG;
import flixel.FlxSprite;

class Island extends BaseStage
{
    var island:BGSprite;
    var red:BGSprite;

    override function create()
    {
		var island:BGSprite = new BGSprite('images/stages/island/island', -2500, -775, 1, 1.5);
		add(island);

        var red:BGSprite = new BGSprite('images/stages/island/red', -750, 0, 1, 1.3);
		add(red);

        super.create();
    }
}