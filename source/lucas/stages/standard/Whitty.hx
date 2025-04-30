package lucas.stages.standard;

import states.stages.objects.*;
import objects.Character;

class Whitty extends BaseStage
{
    var alleyback:BGSprite;
    var front:BGSprite;

    override function create()
    {
        alleyback = new BGSprite('stages/whitty/whittyBack', -650, -300,  0.9);
        add(alleyback);

        front = new BGSprite('stages/whitty/whittyFront', -650, 600,  0.9, 1);
        add(front);

        super.create();
    }
}