package lucas.funkin.engine.mods;

class PolusRed extends BaseStage
{
    var PolusSky:BGSprite;
    var HillsRocks:BGSprite;
	var polusHills:BGSprite;
    var polusLab:BGSprite;
	var polusSnow:FlxSprite;
	override function create()
	{
		PolusSky = new BGSprite('polus/polus_custom_sky', -1050, -850);
		PolusSky.scrollFactor.set(0.7, 0.7);
		PolusSky.scale.set(1.85, 1.85);
		PolusSky.updateHitbox();
		add(PolusSky);

		HillsRocks = new BGSprite('polus/polusrocks', -720, -320);
		HillsRocks.scrollFactor.set(0.8, 0.8);
		add(HillsRocks);

		polusHills = new BGSprite('polus/polusHills', -1050, -185);
		polusHills.scrollFactor.set(0.9, 0.9);
		add(polusHills);

		polusLab = new BGSprite('polus/polus_custom_lab', 30, -390);
		polusLab.scrollFactor.set(0.95, 0.95);
		add(polusLab);

		if(!ClientPrefs.data.lowQuality) {
		var polusSnow:FlxSprite = new FlxSprite(-600, -500);
		polusSnow.frames = Paths.getSparrowAtlas("polus/snow");
		polusSnow.animation.addByPrefix("snow", "cum", 24, true);
		polusSnow.animation.play("snow");
		add(polusSnow);
		}
	}
}