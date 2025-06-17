package lucas.engine.stages.standard;

import objects.Character;

class Alley extends BaseStage
{
    var bg:BGSprite;
    var bg2:BGSprite;
    var floor:BGSprite;
    var fg:BGSprite;

    public function new()
    {
        super();
        bg = new BGSprite('stages/Hypno bg background', -300, -600);
        add(bg);

        bg2 = new BGSprite('stages/Hypno bg background', -300, -600);
        add(bg2);

        floor = new BGSprite('stages/Hypno bg midground', -300, -600);
        add(floor);

        fg = new BGSprite('stages/Hypno bg foreground', -300, -600);
        add(fg);
    }
}