package lucas.stages.standard;

import states.stages.objects.*;
import objects.Character;

class Tokyo extends BaseStage
{
        var Tokyo:BGSprite;

    	override function create()
	{
        var Tokyo:BGSprite = new BGSprite('Stages/Nova pasta/Tokyo', -655, -290,  1);
		add(Tokyo);

		}
}
