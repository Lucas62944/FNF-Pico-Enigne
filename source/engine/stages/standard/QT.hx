package engine.stages.standard;

import objects.Character;

class QT extends BaseStage
{
    var bg:BGSprite;
    var tvnormal:BGSprite;

    public function new()
    {
        super();
        bg = new BGSprite('stages/TrashAlley/M4N4G3R5/wall-Normal', -500, -200);
        add(bg);

        tvnormal = new BGSprite('stages/TrashAlley/M4N4G3R5/tvFront-Normal', -150, 650, 1);
        add(tvnormal);
    }
}