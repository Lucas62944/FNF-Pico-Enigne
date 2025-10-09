package lucas.states.vslice.stages;

import lucas.funkin.vslice.stages.original.*;
import lucas.funkin.vslice.stages.erect.*;
import lucas.funkin.vslice.stages.mods.*;
import haxe.ds.List;

class OriginalLoader extends BaseStage
{
    public static function addstage(name:String) {
        switch (name)
        {
            case 'MainStage': new StageWeek1();                    //Week 1
            case 'spooky': new Spooky();                           //Week 2
            case 'philly': new Philly();						   //Week 3
            case 'limo': new Limo();							   //Week 4
            case 'mall': new Mall();							   //Week 5 - Cocoa, Eggnog
            case 'mallEvil': new MallEvil();					   //Week 5 - Winter Horrorland
            case 'school': new School();						   //Week 6 - Senpai, Roses
            case 'schoolEvil': new SchoolEvil();				   //Week 6 - Thorns
            case 'tank': new Tank();							   //Week 7 - Ugh, Guns, Stress
            case 'phillyStreets': new PhillyStreets();             //Weekend 1 - Darnell, Lit Up, 2Hot
            case 'MainStageErect': new MainStageErect();           //Week 1 Erect
            case 'phillyStreetsErect': new PhillyStreetsErect();   //Weekend 1 Erect - Darnell Erect
            case 'QT': new QTStage();                              //QTWeek - Blissful (Pico Mix) - PicoEngineMods
        }
    }
}