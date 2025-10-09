package lucas.states.engine.stages;

import lucas.funkin.engine.*;
import lucas.funkin.engine.mods.corruption.*;
import lucas.funkin.engine.mods.*;
import haxe.ds.List;
import psychlua.FunkinLua;

// Pico Engine
import lucas.states.engine.menus.MainMenuState;

class EngineLoader extends BaseStage {
    #if LUA_ALLOWED
    public static function implement(funk:FunkinLua)
    {
        var lua:State = funk.lua;
        funk.set('versionPS', MainMenuState.PicoEngineVersion.trim());
    }
    #end

    public static function addstage(name:String) 
{
        switch (name)
        {
            case 'shaggy-hill': new Shaggy();			       //Week Special
            case 'Arenanew': new Arenanew();			       //Week Special
            case 'Malediction': new MaledictionStage();		   //Week Special
            case 'CastleBowser': new CastleBowser();		   //Week Special
            case 'hypno': new Alley();			               //Week Special
            case 'neneStage': new NeneStage();                 //Week Special
            case 'HappyRon': new HappyRon();                   //Week Special
            case 'EndlessEncore': new EndlessEncore();         //Week Special
            case 'Polus': new PolusRed();                      //Week Special
            case 'sbz': new SBz();                             //Week Special
            case 'hall': new SansHall();                       //Week Special
            case 'Curse': new CurseTabi();                     //Week Special
       }
    }
}
