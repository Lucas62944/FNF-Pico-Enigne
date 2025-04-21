package states.editors.content;


import sys.io.File;
import haxe.Json;
import openfl.utils.Assets;

using StringTools;

class ModchartLoader {
    public static var stage:String = "stage";
    public static var events:Array<Dynamic> = [];
    public static var modchart:Array<Dynamic> = [];

    public static function loadModchart(modchart:String):Void {
        var path:String = "modchart/data/" + modchart + ".hxc";

        if (!FileSystem.exists(path)) {
            trace("[ModchartLoader] Arquivo de modchart não encontrado: " + path);
            return;
        }

        try {
            var rawJson:String = File.getContent(path);
            var json:Dynamic = Json.parse(rawJson);

            if (json.stage != null) stage = json.stage;
            if (json.events != null) events = json.events;
            if (json.modchart != null) modchart = json.modchart;

            trace("[ModchartLoader] Modchart carregado com sucesso: " + modchart);
        } catch (e:Dynamic) {
            trace("[ModchartLoader] Erro ao carregar modchart: " + e);
        }
    }
}
