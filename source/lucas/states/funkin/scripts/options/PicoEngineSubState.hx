package lucas.states.funkin.scripts.options;

import options.Option;
import options.BaseOptionsMenu;

class PicoEngineSubState extends BaseOptionsMenu {
	public function new() {
    title = Language.getPhrase("vslice_menu","Pico Engine settings (W.I.P)");
    rpcTitle = "Pico-Engine settings menu";
{
		var option:Option = new Option('Characters Note Skins',
			"If checked, Enables character-specific noteskins during songs (W.I.P)",
			'noteskinsCharacters',
			STRING,
			['Player','Opponent','Both']);
		addOption(option);
		
        var option:Option = new Option('Max Combo (W.I.P)',
		'Enable/Disable Max Combo on the game screen.',
		'comboEnabled',
		BOOL);
	    addOption(option);

		var option:Option = new Option('V-Slice Hub (W.I.P)',
		'If checked, using the HUD for V-Slice.',
		'hub',
		BOOL);
		addOption(option);

		var option:Option = new Option('Hold Note (W.I.P)',
		'Enable/Disable to prevent characters from performing hold animations during music.',
		'hold',
		BOOL);
		addOption(option);
		super();
		}
	}
}
