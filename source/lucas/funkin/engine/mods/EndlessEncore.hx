package lucas.funkin.engine.mods;

class EndlessEncore extends BaseStage
{ 
    var forest:BGSprite;
    var forest2:BGSprite;
	override function create()
	{
		forest = new BGSprite('sonicexe/Endless/main stage', -1100, -500);
		add(forest);

		forest2 = new BGSprite('sonicexe/Endless/front trees 1', -1100, -500);
		add(forest2);
	}
}