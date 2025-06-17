package lucas;

import lucas.engine.stages.erect.*;
import lucas.engine.stages.standard.*;
import lucas.engine.stages.erect.spooky.*;
import lucas.engine.stages.standard.corruption.*;
import lucas.engine.unused.stages.*;
import lucas.engine.objects.*;
import lucas.engine.objects.capable.PicoCapableStage;
import haxe.ds.List;
import psychlua.FunkinLua;
import states.MainMenuState;

class EventLoader extends BaseStage {
    #if LUA_ALLOWED
    public static function implement(funk:FunkinLua)
    {
        var lua:State = funk.lua;
        funk.set('versionPS', MainMenuState.picoEngineVersion.trim());
        Lua_helper.add_callback(lua, "markAsPicoCapable", function() {
            new PicoCapableStage();
        });
    }
    #end
    public static function addstage(name:String) {
        var addNene = true;
        switch (name)
        {
            case 'MainStage': new MainStageErect();			//Week 1 Special 
            case 'philly-erect': new PhillyErect();			//Week 3 Special
            case 'phillyStreets': new PhillyStreets(); 				//Weekend 1 - Darnell, Lit Up, 2Hot
            case 'phillyStreetsErect': new PhillyStreetsErect(); 	//Weekend 1 Special  
            case 'qt': new QT();			//Week Special
            case 'hypno': new Alley();			//Week Special
            default: addNene = true;
        }
        if(addNene) new PicoCapableStage();
    } 
}
