package lucas.funkin.engine.stages.standard;

import objects.Character;
import objects.Note;

class Castle extends BaseStage
{
    var bg:BGSprite;
    var wall:BGSprite;
    var flopor:BGSprite;
    var darnell:FlxSprite;

    public function new()
    {
        super();

        bg = new BGSprite('bowser/bg', -155, -250, 1.2, 0.8);
        add(bg);

        wall = new BGSprite('bowser/walls', -185, 650, 0.9, 0.9);
        add(wall);

        flopor = new BGSprite('bowser/main_flopor', 0, 375, 1, 1.0);
        add(flopor);

        darnell = new FlxSprite(2369, 739);
        darnell.frames = Paths.getSparrowAtlas('characters/darnell');
        darnell.animation.addByPrefix("idle", "Idle", 24);
        darnell.scale.set(1);
        add(darnell);
    }
}