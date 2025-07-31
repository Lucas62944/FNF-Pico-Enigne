package lucas.engine.stages.erect.spooky;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import shaders.AdjustColorShader;

class PhillyStreetsErectSpooky extends BaseStage
{
    var skybox:BGSprite;
    var skyline:BGSprite;
    var foregroundCity:BGSprite;
    var construction:BGSprite;
    var highwayLights:BGSprite;
    var highway:BGSprite;
    var smog:BGSprite;
    var cars:FlxSprite;
    var molochCandleGlow:FlxSprite;
    var foreground:BGSprite;
    var traffic:FlxSprite;
    var mistMid:BGSprite;
    var mistFront:BGSprite;
    var grey1:BGSprite;
    var grey2:BGSprite;
    var colorShader:AdjustColorShader;

    override function create()
    {
        var darnell = "weekend1/phillyStreets/spooky";

        // Grey gradient (opcional)
        if (false) { // greyShader
            grey1 = new BGSprite(darnell + "/greyGradient", 88, 1117);
            grey1.alpha = 0.3;
            add(grey1);

            grey2 = new BGSprite(darnell + "/greyGradient", 88, 1117);
            grey2.alpha = 0.8;
            add(grey2);
        }

        if (!ClientPrefs.data.lowQuality) {
            skybox = new BGSprite(darnell + "/phillySkybox", -545, -73, 0.2, 0.2);
            add(skybox);

            skyline = new BGSprite(darnell + "/phillySkyline", -545, -73, 0.2, 0.2);
            add(skyline);

            foregroundCity = new BGSprite(darnell + "/phillyForegroundCity", 600, 299, 0.3, 0.3);
            add(foregroundCity);
        }

        construction = new BGSprite(darnell + "/phillyConstruction", 1795, -30, 0.7, 0.1);
        add(construction);

        if (!ClientPrefs.data.lowQuality) {
            highwayLights = new BGSprite(darnell + "/phillyHighwayLights", 108, 1037);
            highwayLights.blend = ADD;
            add(highwayLights);
        }

        highway = new BGSprite(darnell + "/phillyHighway", 88, 937);
        add(highway);

        smog = new BGSprite(darnell + "/phillySmog", 46, 985);
        add(smog);

        cars = new FlxSprite(1688, 1500);
        cars.frames = Paths.getSparrowAtlas(darnell + "/phillyCars");
        cars.animation.addByPrefix("car", "car1", 12, true);
        cars.animation.play("car");
        cars.angle = -3;
        add(cars);

        molochCandleGlow = new FlxSprite(1210, 1360);
        molochCandleGlow.frames = Paths.getSparrowAtlas(darnell + "/molochCandleGlow");
        molochCandleGlow.animation.addByPrefix("light", "glowg", 24, true);
        molochCandleGlow.animation.play("light");
        molochCandleGlow.alpha = 0.6;
        add(molochCandleGlow);

        foreground = new BGSprite(darnell + "/phillyForeground", 88, 1037);
        add(foreground);

        traffic = new FlxSprite(1888, 1337);
        traffic.frames = Paths.getSparrowAtlas(darnell + "/phillyTraffic");
        traffic.animation.addByPrefix("color", "greentored", 12, true);
        traffic.animation.play("color");
        add(traffic);

        // Névoa
        var x = 248;
        var y = 917;
        var scale = 1.4;
        mistMid = new BGSprite(darnell + "/fog", x, y);
        mistMid.alpha = 0.6;
        mistMid.blend = ADD;
        add(mistMid);

        mistFront = new BGSprite(darnell + "/fog", x, y);
        mistFront.alpha = 0.6;
        mistFront.blend = ADD;
        add(mistFront);

        // Shaders (onUpdatePost)
        if (!ClientPrefs.data.shaders) {
            colorShader = new AdjustColorShader();
            colorShader.hue = -5;
            colorShader.saturation = -40;
            colorShader.contrast = -25;
            colorShader.brightness = -25;
            dad.shader = colorShader;
            gf.shader = colorShader;
            boyfriend.shader = colorShader;
        } else {
            dad.shader = null;
            gf.shader = null;
            boyfriend.shader = null;
        }
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        // Aqui você pode adicionar a lógica de movimento da névoa, carros, etc.
    }

    override function beatHit()
    {
        super.beatHit();
        // Adapte a lógica de animação dos carros, semáforo, etc.
    }

    // Adapte eventos, timers e funções de posição conforme necessário!
}