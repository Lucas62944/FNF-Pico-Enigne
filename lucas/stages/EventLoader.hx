package lucas.stages;

import lucas.stages.standard.*;
import lucas.stages.objects.*;
import lucas.stages.erect.*;
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
			case 'Philly': new Philly();							//Week 3
			case 'Tank': new Tank();								//Week 7 - Ugh, Guns, Stress
			case 'phillyStreets': new PhillyStreets(); 				//Weekend 1 - Darnell, Lit Up, 2Hot
			case 'MainStage': new MainStageErect();			//Week 1 Special 
			case 'Philly-Erect': new PhillyErect();  		//Week 3 Special 
			case 'phillyStreetsErect': new PhillyStreetsErect(); 	//Weekend 1 Special 
            default: addNene = false;
		}
        if(addNene) new PicoCapableStage();
    } 
}