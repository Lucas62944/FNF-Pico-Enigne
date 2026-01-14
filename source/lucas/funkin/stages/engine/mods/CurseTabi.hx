package lucas.funkin.stages.engine.mods;

class CurseTabi extends BaseStage
{
    var Normal:BGSprite;
    var Sumtable:BGSprite;
    override function create()
    {
		Normal = new BGSprite('tabi/normal_stage', -510, -230);
		add(Normal);

    Sumtable = new BGSprite('tabi/sumtable', -510, -230);
		add(Sumtable);
    }
}