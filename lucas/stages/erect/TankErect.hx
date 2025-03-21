package lucas.stages.erect;

import states.stages.objects.*;

class TankErect extends BaseStage
{
    override public function create():Void
    {
        super.create();

        var tankSky:BGSprite = new BGSprite("Erect/tankSky", -400, -400);
        tankSky.scrollFactor.set(0, 0);
        add(tankSky);

        var tankMountains:BGSprite = new BGSprite("Erect/tankMountains", -280, -20);
        tankMountains.scrollFactor.set(0.2, 0.2);
        tankMountains.scale.set(1.2, 1.2);
        add(tankMountains);

        var tankBuildings:BGSprite = new BGSprite("Erect/tankBuildings", -180, 0);
        tankBuildings.scrollFactor.set(0.3, 0.3);
        tankBuildings.scale.set(1.1, 1.1);
        add(tankBuildings);

        var tankRuins:BGSprite = new BGSprite("Erect/tankRuins", -180, 0);
        tankRuins.scrollFactor.set(0.35, 0.35);
        tankRuins.scale.set(1.1, 1.1);
        add(tankRuins);

        var tankClouds:BGSprite = new BGSprite("Erect/tankClouds", 0, 0);
        tankClouds.scrollFactor.set(0.4, 0.4);
        add(tankClouds);

        var smokeLeft:BGSprite = new BGSprite("Erect/Smokes/smokeLeft", -200, 0);
        smokeLeft.animation.addByPrefix("smokeLeft", "SmokeBlurLeft", 24, true);
        smokeLeft.scrollFactor.set(0.4, 0.4);
        add(smokeLeft);

        var smokeRigh:BGSprite = new BGSprite("Erect/Smokes/smokeRigh", 1100, -100);
        smokeRigh.animation.addByPrefix("smokeRigh", "smokeRigh", 24, true);
        smokeRigh.scrollFactor.set(0.4, 0.4);
        add(smokeRigh);

        var tankWatchtower:BGSprite = new BGSprite("Erect/tankWatchtower", 100, 50);
        tankWatchtower.animation.addByPrefix("tankWatchtower", "watchtower gradient color", 24, true);
        tankWatchtower.scrollFactor.set(0.5, 0.5);
        add(tankWatchtower);

        var tankGround:BGSprite = new BGSprite("Erect/tankGround", -420, -150);
        tankGround.scale.set(1.15, 1.15);
        tankGround.scrollFactor.set(0.4, 0.4);
        add(tankGround);

        var tankmanAudience0:BGSprite = new BGSprite("Erect/Tanks/tank0", -500, 650);
        tankmanAudience0.animation.addByPrefix("tankmanAudience0", "fg tankhead far right instance 1", 24, true);
        tankmanAudience0.scrollFactor.set(1.7, 1.5);
        add(tankmanAudience0);

        var tankmanAudience2:BGSprite = new BGSprite("Erect/Tanks/tank2", 360, 980);
        tankmanAudience2.animation.addByPrefix("tankmanAudience2", "foreground man 3 instance 1", 24, true);
        tankmanAudience2.scrollFactor.set(1.5, 1.5);
        add(tankmanAudience2);

        var tankmanAudience3:BGSprite = new BGSprite("Erect/Tanks/tank3", 1050, 1240);
        tankmanAudience3.animation.addByPrefix("tankmanAudience3", "fg tankhead 4 instance 1", 24, true);
        tankmanAudience3.scrollFactor.set(3.5, 2.5);
        add(tankmanAudience3);

        var tankmanAudience4:BGSprite = new BGSprite("Erect/Tanks/tank4", 1200, 900);
        tankmanAudience4.animation.addByPrefix("tankmanAudience4", "fg tankman bobbin 3 instance 1", 24, true);
        tankmanAudience4.scrollFactor.set(1.5, 1.5);
        add(tankmanAudience4);

        var tankmanAudience5:BGSprite = new BGSprite("Erect/Tanks/tank5", 1550, 700);
        tankmanAudience5.animation.addByPrefix("tankmanAudience5", "fg tankhead far right instance 1", 24, true);
        tankmanAudience5.scrollFactor.set(1.5, 1.5);
        add(tankmanAudience5);

        var tankmanAudience1:BGSprite = new BGSprite("Erect/Tanks/tank1", -300, 750);
        tankmanAudience1.animation.addByPrefix("tankmanAudience1", "fg tankhead 5 instance 1", 24, true);
        tankmanAudience1.scrollFactor.set(2.0, 0.2);
        add(tankmanAudience1);
    }
}