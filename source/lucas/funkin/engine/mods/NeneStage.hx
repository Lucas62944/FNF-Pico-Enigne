package lucas.funkin.engine.mods;

import objects.*;

class NeneStage extends BaseStage
{
    var Sky:BGSprite;
    var ddTower:BGSprite;
    var heli1:BGSprite;
    var heli2:BGSprite;
    var city:BGSprite;
    var bg:BGSprite;
    override function create()
{ 
     Sky = new BGSprite('stageNene/sky', -500, -350);
     Sky.scale.set(1.1, 1.1);
     Sky.scrollFactor.set(0.3, 0.3);
     add(Sky);

     ddTower = new BGSprite('stageNene/ddTower', -350, -150);
     ddTower.scrollFactor.set(1.2, 1.2);
     add(ddTower);

     heli1 = new BGSprite('stageNene/helicopter1', 750, 50);
     heli1.scrollFactor.set(1.2, 1.2);
     add(heli1);

     heli2 = new BGSprite('stageNene/helicopter2', 450, -100);
     heli2.scrollFactor.set(1.2, 1.2);
     add(heli2);

     city = new BGSprite('stageNene/city', 0, 280);
     city.scale.set(0.9, 0.9);
     city.scrollFactor.set(1.2, 1.2);
     add(city);

     bg = new BGSprite('stageNene/stage', -1100, -50);
     bg.scale.set(1.1, 1.1);
     bg.scrollFactor.set(1, 1);
     add(bg);
    }
}