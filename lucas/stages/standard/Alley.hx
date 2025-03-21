package lucas.stages.standard;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Alley extends BaseStage
{
    private var purinHitbox:FlxSprite;
    private var hypnoGuide:FlxSprite;
    private var brimstoneHand:FlxSprite;
    private var brimStoneHandOccured:Bool = false;

    private var foreground:FlxGroup;

    override public function create():Void
    {
        super.create();
        trace('heepnooo');

        foreground = new FlxGroup();
        add(foreground);

        var consistentPosition:Array<Float> = [-800, -300];
        var resizeBG:Float = 0.7;
        PlayState.instance.defaultCamZoom = 0.65; // Use instance

        if (PlayState.old) {
            PlayState.instance.defaultCamZoom = 0.7;

            var background:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            background.loadGraphic(Paths.image('old/Hypno bg background'));
            background.setGraphicSize(Std.int(background.width * resizeBG));
            background.updateHitbox();
            background.antialiasing = true;
            background.scrollFactor.set(0.6, 0.6);
            background.active = false;
            add(background);

            var midGround:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            midGround.loadGraphic(Paths.image('old/Hypno bg midground'));
            midGround.setGraphicSize(Std.int(midGround.width * resizeBG));
            midGround.updateHitbox();
            midGround.antialiasing = true;
            midGround.active = false;
            add(midGround);

            var stageForeground:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            stageForeground.loadGraphic(Paths.image('old/Hypno bg foreground'));
            stageForeground.setGraphicSize(Std.int(stageForeground.width * resizeBG));
            stageForeground.updateHitbox();
            stageForeground.antialiasing = true;
            stageForeground.scrollFactor.set(1.2, 1.2);
            stageForeground.active = false;
            foreground.add(stageForeground);
        } else {
            var background:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            background.loadGraphic(Paths.image('BACKGROUND'));
            background.setGraphicSize(Std.int(background.width * resizeBG));
            background.updateHitbox();
            background.antialiasing = true;
            background.scrollFactor.set(0.6, 0.6);
            background.active = false;
            add(background);

            var grass:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            grass.loadGraphic(Paths.image('Behind the clouds and fence'));
            grass.setGraphicSize(Std.int(grass.width * resizeBG));
            grass.updateHitbox();
            grass.antialiasing = true;
            grass.scrollFactor.set(0.7, 0.7);
            grass.active = false;
            add(grass);

            var fog:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            fog.loadGraphic(Paths.image('Behind the Fence'));
            fog.setGraphicSize(Std.int(fog.width * resizeBG));
            fog.updateHitbox();
            fog.scrollFactor.set(0.8, 0.8);
            fog.antialiasing = true;
            fog.active = false;
            add(fog);

            var midground:BGSprite = new BGSprite(consistentPosition[0], consistentPosition[1]);
            var name:String = 'MIDGROUND';
            if (PlayState.SONG.song == 'Left-Unchecked')
                name = name + ' BLOOD';
            midground.loadGraphic(Paths.image(name));
            midground.setGraphicSize(Std.int(midground.width * resizeBG));
            midground.updateHitbox();
            midground.antialiasing = true;
            midground.active = false;
            add(midground);

            var stageForeground:BGSprite = new BGSprite(consistentPosition[0] - 100, consistentPosition[1]);
            stageForeground.loadGraphic(Paths.image('FOREGROUND TREE'));
            stageForeground.setGraphicSize(Std.int(stageForeground.width * resizeBG));
            stageForeground.updateHitbox();
            stageForeground.antialiasing = true;
            stageForeground.scrollFactor.set(1.2, 1.2);
            stageForeground.active = false;
            foreground.add(stageForeground);

            purinHitbox = new FlxSprite(consistentPosition[0] + 100, consistentPosition[1] + 300);
            purinHitbox.makeGraphic(1000, 700, FlxColor.fromRGB(255, 255, 255));
            purinHitbox.visible = false;
            add(purinHitbox);

            trace(boyfriend.x);
            boyfriend.x += 200;
        }

        dad.x -= 200;

        brimstoneHand = new FlxSprite(760, 100);
        brimstoneHand.frames = Paths.getSparrowAtlas('White_Hand');
        brimstoneHand.animation.addByPrefix('idle', 'White Hand FInished', 24, false);
        brimstoneHand.animation.play('idle');
        brimstoneHand.updateHitbox();
        brimstoneHand.antialiasing = true;
        brimstoneHand.setGraphicSize(Std.int(brimstoneHand.width * 0.65));
        add(brimstoneHand);
        brimstoneHand.visible = false;
    }

    override public function createPost():Void
    {
        PlayState.instance.disableCountdown = false;
        PlayState.instance.dadStrums.visible = false;

        if (FlxG.save.data.itemsPurchased.contains('Lit Candle') && !FlxG.save.data.activatedPurin)
        {
            FlxG.mouse.visible = true;
            FlxG.mouse.useSystemCursor = true;
        }

        hypnoGuide = new FlxSprite(530, 370);
        hypnoGuide.frames = Paths.getSparrowAtlas('UI/base/hypno/Extras');
        hypnoGuide.animation.addByPrefix('press', 'Spacebar', 24, false);
        hypnoGuide.animation.play('press');
        hypnoGuide.updateHitbox();
        hypnoGuide.antialiasing = true;
        add(hypnoGuide);
        hypnoGuide.cameras = [PlayState.camHUD];
        hypnoGuide.alpha = 0.0001;
    }

    override public function beatHit(beat:Int):Void
    {
        if (hypnoGuide != null && PlayState.instance.curSong == 'Safety Lullaby')
        {
            if (beat == 2) FlxTween.tween(hypnoGuide, {alpha: 1.0}, 0.5, {ease: FlxEase.cubeInOut});
            if (beat == 14) FlxTween.tween(hypnoGuide, {alpha: 0.0}, 0.5, {ease: FlxEase.cubeInOut});
            if (beat % 2 == 0) hypnoGuide.animation.play('press');
        }

        if (!brimStoneHandOccured && FlxG.random.bool(1))
        {
            brimStoneHand();
        }
    }

    private function brimStoneHand():Void
    {
        brimStoneHandOccured = true;
        brimstoneHand.visible = true;
        brimstoneHand.animation.play('idle');
        brimstoneHand.animation.finishCallback = function(name:String)
        {
            brimstoneHand.alpha = 0.0001;
        }
    }
}