package lucas.states.vslice.scripts.options;

class VsliceOptions 
{
    public static var ANTIALIASING(get,never):Bool;    
    public static function get_ANTIALIASING():Bool {
        return ClientPrefs.data.antialiasing;
    }
    public static var LOW_QUALITY(get,never):Bool;    
    public static function get_LOW_QUALITY():Bool {
        return ClientPrefs.data.lowQuality;
    }
    public static var SHADERS(get,never):Bool;    
    public static function get_SHADERS():Bool {
        return ClientPrefs.data.shaders;
    }
    public static var FLASHBANG(get,never):Bool;    
    public static function get_FLASHBANG():Bool {
        return ClientPrefs.data.flashing;
    }
}