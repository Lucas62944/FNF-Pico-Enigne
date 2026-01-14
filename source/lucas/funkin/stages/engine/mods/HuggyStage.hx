package lucas.funkin.stages.engine.mods;

import objects.*;

class HuggyStage extends BaseStage
{
    var toyFactory:BGSprite;
    var theShadow:BGSprite;
    override function create()
    { 
    var toyFactory = new BGSprite('stages/HuggyWuggy/factory', -500, -330, 0.9, 0.9);
	add(toyFactory);

    var theShadow:BGSprite = new BGSprite('stages/HuggyWuggy/shadow', -500, -100, 0.9, 0.9);
	add(theShadow);
    }
}