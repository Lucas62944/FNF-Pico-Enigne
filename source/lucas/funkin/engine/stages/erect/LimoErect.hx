package lucas.engine.stages.erect;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import shaders.AdjustColorShader;

class LimoErect extends BaseStage
{
    var sunset:BGSprite;
    var shootingStar:FlxSprite;
    var limoBG:FlxSprite;
    var henchmen:Array<FlxSprite> = [];
    var car:FlxSprite;
    var limo:FlxSprite;
    var mist:Array<FlxSprite> = [];
    var colorShader:AdjustColorShader;
    var enableShaders:Bool = true;

    override function create()
    {
        sunset = new BGSprite('limo/erect/limoSunset', -220, -80, 0.1, 0.1);
        sunset.setGraphicSize(Std.int(sunset.width * 0.9));
        sunset.updateHitbox();
        add(sunset);

        shootingStar = new FlxSprite(200, 0);
        shootingStar.frames = Paths.getSparrowAtlas('limo/erect/shooting star');
        shootingStar.animation.addByPrefix('anim', 'shooting star', 24, false);
        shootingStar.scrollFactor.set(0.12, 0.12);
        shootingStar.blend = ADD;
        shootingStar.visible = false;
        add(shootingStar);

        if (!ClientPrefs.data.lowQuality) {
            limoBG = new FlxSprite(-200, 480);
            limoBG.frames = Paths.getSparrowAtlas('limo/erect/bgLimo');
            limoBG.animation.addByPrefix('anim', 'background limo blue');
            limoBG.scrollFactor.set(0.4, 0.4);
            limoBG.animation.play('anim');
            add(limoBG);

            for (i in 0...5) {
                var h = new FlxSprite(limoBG.x + 300 * (i + 1), 100);
                h.frames = Paths.getSparrowAtlas('limo/limoDancer');
                h.animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [for (j in 0...15) j], '', 24, false);
                h.animation.addByIndices('danceRight', 'bg dancer sketch PINK', [for (j in 15...30) j], '', 24, false);
                h.scrollFactor.set(0.4, 0.4);
                h.animation.play('danceLeft');
                add(h);
                henchmen.push(h);
            }
        }

        car = new FlxSprite(-12600, 160);
        car.loadGraphic(Paths.image('limo/fastCarLol'));
        add(car);

        limo = new FlxSprite(-120, 520);
        limo.frames = Paths.getSparrowAtlas('limo/erect/limoDrive');
        limo.animation.addByPrefix('anim', 'Limo stage');
        limo.animation.play('anim');
        add(limo);

        // Inicia animação da GF
        if (gf != null) {
            gf.playAnim('hairFall', true);
            gf.specialAnim = true;
        }
    }

    override function createPost()
    {
        super.createPost();

        // Névoa (mist)
        if (!ClientPrefs.data.lowQuality) {
            // Adapte para FlxSprite, BGSprite ou FlxTypedGroup conforme seu engine
            // Exemplo de uma névoa:
            // var mist1 = new FlxSprite(-650, -100);
            // mist1.loadGraphic(Paths.image('limo/erect/mistMid'));
            // mist1.scrollFactor.set(1.1, 1.1);
            // mist1.alpha = 0.4;
            // mist1.color = 0xC6BFDE;
            // add(mist1);
            // mist.push(mist1);
            // Repita para as outras camadas de névoa conforme o mistData do Lua
        }

        // Shaders
        if (!ClientPrefs.data.shaders) {
            colorShader = new AdjustColorShader();
            colorShader.hue = -30;
            colorShader.saturation = -20;
            colorShader.contrast = 0;
            colorShader.brightness = -30;
            boyfriend.shader = colorShader;
            dad.shader = colorShader;
            gf.shader = colorShader;
            car.shader = colorShader;
            for (h in henchmen) h.shader = colorShader;
        }
    }

    override function beatHit()
    {
        super.beatHit();
        // Troca animação dos henchmen
        if (!ClientPrefs.data.lowQuality) {
            for (i in 0...henchmen.length) {
                var anim = (curBeat % 2 == 0) ? 'danceLeft' : 'danceRight';
                henchmen[i].animation.play(anim, true);
            }
        }
        // Carro e shooting star (adicione lógica de randomização conforme o Lua)
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        // Atualize a névoa, shooting star, carro, etc.
        // Adapte a lógica de movimento e eventos conforme necessário
    }

    // Adapte eventos, timers e partículas conforme necessário para seu engine!
}