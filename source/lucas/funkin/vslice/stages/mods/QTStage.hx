package lucas.funkin.vslice.stages.mods;

import objects.Character;

class QTStage extends BaseStage
{
	var wallnormal:BGSprite;
    var overlaynormal:BGSprite;
	var light:BGSprite;
	var overlaynormalOTHER:BGSprite;
	var tvnormal:BGSprite;
	var gfspeaker:FlxSprite;
	var BLACK:FlxSprite;
	var RED:FlxSprite;
	var WHITE:FlxSprite;
	override function create()
	{
		wallnormal = new BGSprite('TrashAlley/M4N4G3R5/wall-Normal', -500, -200);
		add(wallnormal);

		overlaynormal = new BGSprite('TrashAlley/M4N4G3R5/overlay-Normal', 0, 0);
		overlaynormal.cameras = [camHUD];
		overlaynormal.blend = ADD;
		add(overlaynormal);

		light = new BGSprite('TrashAlley/lightFocus', 120, -550);
		light.alpha = 0;
		add(light);

		overlaynormalOTHER = new BGSprite('TrashAlley/M4N4G3R5/overlay-Normal', 0, 0);
		overlaynormalOTHER.cameras = [camOther];
		overlaynormalOTHER.alpha = 0;
		overlaynormalOTHER.blend = ADD;
		add(overlaynormalOTHER);

		var gfspeaker:FlxSprite = new FlxSprite(600, 300);
		gfspeaker.frames = Paths.getSparrowAtlas("characters/speaker_assets");
		gfspeaker.animation.addByPrefix("bumpBox", "bumpBox", 24, false);
		gfspeaker.animation.play("bumpBox", true);
		add(gfspeaker);

		var BLACK:FlxSprite = new FlxSprite(-500, -500);
		BLACK.makeGraphic(5000, 5000, FlxColor.BLACK);
		BLACK.alpha = 0;
		add(BLACK);

		var RED:FlxSprite = new FlxSprite(0, -500);
		RED.makeGraphic(2000, 2000, FlxColor.RED);
		RED.alpha = 0;
		add(RED);

		var WHITE:FlxSprite = new FlxSprite(0, 0);
		WHITE.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		WHITE.cameras = [camOther];
		WHITE.alpha = 0;
		add(WHITE);

		tvnormal = new BGSprite('TrashAlley/M4N4G3R5/tvFront-Normal', -150, 650);
		add(tvnormal);
	}
}