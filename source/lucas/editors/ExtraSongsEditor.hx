package lucas.editors;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxInputText;
import flixel.ui.FlxCheckBox;
import flixel.util.FlxColor;
import haxe.Json;
import sys.io.File;
import sys.FileSystem;

class ExtraSongsEditor extends FlxState
{
    var inputSong:FlxInputText;
    var inputDiff:FlxInputText;
    var inputColor:FlxInputText;
    var inputDisplayName:FlxInputText;
    var inputIdName:FlxInputText;
    var showInExtrasCheck:FlxCheckBox;
    var statusText:FlxText;

    override public function create():Void
    {
        super.create();

        var title = new FlxText(0, 20, FlxG.width, "Editor de Extra Songs", 32);
        title.setFormat(null, 32, FlxColor.WHITE, "center");
        add(title);

        var yOffset = 80;

        add(new FlxText(50, yOffset, 0, "Song Name:"));
        inputSong = new FlxInputText(200, yOffset, 300, "nome-da-musica");
        add(inputSong);

        yOffset += 40;
        add(new FlxText(50, yOffset, 0, "Difficulties (separadas por vírgula):"));
        inputDiff = new FlxInputText(200, yOffset, 300, "Easy,Normal,Hard");
        add(inputDiff);

        yOffset += 40;
        add(new FlxText(50, yOffset, 0, "Cor HEX (ex: FF00FF):"));
        inputColor = new FlxInputText(200, yOffset, 300, "FF00FF");
        add(inputColor);

        yOffset += 40;
        add(new FlxText(50, yOffset, 0, "Display Name:"));
        inputDisplayName = new FlxInputText(200, yOffset, 300, "Fresh Remix");
        add(inputDisplayName);

        yOffset += 40;
        add(new FlxText(50, yOffset, 0, "ID Interno (opcional):"));
        inputIdName = new FlxInputText(200, yOffset, 300, "fresh-remix");
        add(inputIdName);

        yOffset += 40;
        showInExtrasCheck = new FlxCheckBox(50, yOffset, null, "Aparecer no ExtraSongs?", true);
        add(showInExtrasCheck);

        yOffset += 50;
        var saveButton = new FlxButton(50, yOffset, "Salvar Música", saveSong);
        add(saveButton);

        var backButton = new FlxButton(200, yOffset, "Voltar", function() FlxG.switchState(new MainMenuState()));
        add(backButton);

        yOffset += 50;
        statusText = new FlxText(50, yOffset, 500, "");
        add(statusText);
    }

    function saveSong()
    {
        var songName = inputSong.text.trim();
        var diffList = inputDiff.text.trim().split(",").map(s -> s.trim());
        var hexColor = inputColor.text.trim();
        var displayName = inputDisplayName.text.trim();
        var idName = inputIdName.text.trim();
        var showInExtra = showInExtrasCheck.checked;

        if (songName == "") {
            statusText.text = "Nome da música está vazio!";
            return;
        }

        var entry = {
            song: songName,
            difficulties: diffList,
            color: hexColor,
            displayName: displayName,
            id: idName == "" ? songName : idName,
            showInExtraSongs: showInExtra
        };

        var path = "assets/data/extraSongsList.json";
        var fullList:Array<Dynamic> = [];

        if (FileSystem.exists(path)) {
            var oldData = File.getContent(path);
            fullList = Json.parse(oldData);
        }

        fullList.push(entry);
        File.saveContent(path, Json.stringify(fullList, null, "  "));

        statusText.text = 'Música "' + songName + '" salva com sucesso!';
    }
}
