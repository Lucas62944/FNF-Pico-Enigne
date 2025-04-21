package lucas.psychlua.FunkinLua;

import flixel.util.FlxStringUtil;
import openfl.Lib;
import openfl.utils.Assets;
import sys.FileSystem;
import sys.io.File;
import lua.Lua;

class FunkinLua {
    public var lua:Lua;

    public function new(scriptName:String) {
        lua = new Lua();

        var scriptPath:String = 'assets/shared/scripts/HUB/' + scriptName + '.lua';

        if (FileSystem.exists(scriptPath)) {
            var scriptContent:String = File.getContent(scriptPath);
            lua.doString(scriptContent, scriptName);
            trace('Loaded Lua script: ' + scriptPath);
        } else {
            trace('Lua script not found: ' + scriptPath);
        }
    }

    public function call(functionName:String, ?args:Array<Dynamic>):Dynamic {
        if (lua != null) {
            try {
                return lua.call(functionName, args);
            } catch (e:Dynamic) {
                trace('Error calling Lua function: ' + functionName + ' - ' + e);
            }
        }
        return null;
    }

    public function setVar(name:String, value:Dynamic):Void {
        if (lua != null) {
            lua.setGlobal(name, value);
        }
    }

    public function getVar(name:String):Dynamic {
        if (lua != null) {
            return lua.getGlobal(name);
        }
        return null;
    }

    public function close():Void {
        if (lua != null) {
            lua.close();
            lua = null;
        }
    }
}
