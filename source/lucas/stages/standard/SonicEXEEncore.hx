package lucas.stages.standard;

class SonicEXE extends BaseStage
{
    var angel:BGSprite;
    var BGSky:BGSprite;

    override function create()
    {
        angel = new BGSprite('Stages/Too Slow/angel island', -800, -500, 1, 1.3);
        add(angel);

        BGSky = new BGSprite('Stages/Too Slow/NEWBGSKY', -816, -386, 1, 1.2);
        add(BGSky);

        super.create(); // Certifique-se de chamar o método da classe base
    }

    override function onStepHit()
    {
        if (curStep == 384)
        {
            setProperty('BGSky.visible', true);
            setProperty('angel.visible', false);
        }
    }
}