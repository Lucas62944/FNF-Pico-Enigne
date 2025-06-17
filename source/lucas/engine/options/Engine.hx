package lucas.engine.options;

import objects.CheckboxThingie;
import options.BaseOptionsMenu;
import options.Option;
import flixel.FlxG;

class Engine extends BaseOptionsMenu
{
    public function new()
    {
        super();
    }

    public function getOptions()
    {
        var healthBarOption:Option = new Option('HealthBar Display',
            'If unchecked, the players health will not be displayed.',
            'HealthBar',
            BOOL);
            addOption(option);

        var opponentModeOption:Option = new Option('Opponent mode',
            'play with the character on the left of the screen.',
            'opponentmod',
            BOOL);
            addOption(option);
}
}