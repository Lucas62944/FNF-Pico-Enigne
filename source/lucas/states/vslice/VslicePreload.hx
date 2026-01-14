package lucas.states.vslice;

// Pico Engine
import lucas.funkin.stages.vslice.standard.*;
import lucas.funkin.stages.vslice.erect.*;
import lucas.funkin.stages.vslice.mods.*;

// Psych Engine 1.0.0
import psychlua.FunkinLua;
import states.MainMenuState;

// Haxe
import haxe.ds.List;

// V-Slice
import lucas.states.vslice.*;

class VslicePreload extends BaseStage
{
    #if LUA_ALLOWED
    public static function implement(funk:FunkinLua)
    {
        var lua:State = funk.lua;
        funk.set('versionPS', MainMenuState.PicoVersion.trim());
    }
    #end

        public static function addstage(name:String) 
        {
            switch (name)
            {
            case 'stage': new StageWeek1();                        //Week 1
            case 'MainErect': new StageErect();                    //Week 1 - Erect
            case 'spooky': new Spooky();                           //Week 2
            case 'philly': new Philly();						   //Week 3
            case 'limo': new Limo();							   //Week 4
            case 'mall': new Mall();							   //Week 5 - Cocoa, Eggnog
            case 'mallEvil': new MallEvil();					   //Week 5 - Winter Horrorland
            case 'school': new School();						   //Week 6 - Senpai, Roses
            case 'schoolEvil': new SchoolEvil();				   //Week 6 - Thorns
            case 'tank': new Tank();							   //Week 7 - Ugh, Guns, Stress
            case 'phillyStreets': new PhillyStreets();             //Weekend 1 - Darnell, Lit Up, 2Hot
            case 'phillyStreetsErect': new StreetsErect();         //Weekend 1 Erect - Darnell Erect
            default: null;
       }
    } 
}