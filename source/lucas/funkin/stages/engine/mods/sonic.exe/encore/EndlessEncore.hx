package lucas.funkin.stages.engine.mods.sonic.exe.encore;

class EndlessEncore extends BaseStage
{ 
    var forest:BGSprite;
    var forest2:BGSprite;
	override function create()
	{
		forest = new BGSprite('sonic.exe/Endless/main stage', -1100, -500);
		add(forest);

		forest2 = new BGSprite('sonic.exe/Endless/front trees 1', -1100, -500);
		add(forest2);
	}
}