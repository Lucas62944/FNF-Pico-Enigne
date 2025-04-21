package lucas.stages;

import lucas.stages.standard.*;
import lucas.stages.objects.*;
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
            case 'Island': new Island();							//Week Tricky
            case 'too-slow': new SonicEXE();							//Week SonicEXE
            case 'Ne': new Tokyo();							//Week NENE
            default: addNene = true;
        }
        if(addNene) new PicoCapableStage();
    } 
}