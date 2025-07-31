package lucas.states.engine.stages;

import lucas.funkin.engine.stages.erect.*;
import lucas.funkin.engine.stages.standard.*;
import lucas.funkin.engine.stages.spooky.*;
import lucas.funkin.engine.stages.standard.corruption.*;
import lucas.funkin.engine.stages.unused.stages.*;
import haxe.ds.List;
import psychlua.FunkinLua;
import states.MainMenuState;

class EventLoader extends BaseStage {
    #if LUA_ALLOWED
    public static function implement(funk:FunkinLua)
    {
        var lua:State = funk.lua;
        funk.set('versionPS', MainMenuState.PicoEngineVersion.trim());
    }
    #end
    public static function addstage(name:String) {
        switch (name)
        {
            case 'MainStage': new MainStageErect();			//Week 1 Special 
            case 'shaggy-hill': new Shaggy();			//Week 3 Special
            case 'Arenanew': new Arenanew();			//Week Special
            case 'Malediction': new MaledictionStage();			//Week Special
            case 'castle': new Castle();			//WeekSpecial
            case 'phillyStreets': new PhillyStreets(); 				//Weekend 1 - Darnell, Lit Up, 2Hot
            case 'phillyStreetsErect': new PhillyStreetsErect(); 	//Weekend 1 - Darnell-Erect, Lit-Up-Erect, 2hot-Erect, Danell-BF-Mix,  lit-up-BF-Mix, Lit-up-(BF), 2hot-(BF)
            case 'qt': new QT();			//Week Special
            case 'hypno': new Alley();			//Week Special
       }
    }
}