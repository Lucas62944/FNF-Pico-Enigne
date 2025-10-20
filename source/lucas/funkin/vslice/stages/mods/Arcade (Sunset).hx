package lucas.funkin.vslice.stages.mods;

import states.stages.objects.*;
import objects.Character;

class Arcade (Sunset) extends BaseStage

	override function create()

    var bg:BGSprite = new BGSprite('stageback', -600, -200, 0.9, 0.9);
	add(bg);