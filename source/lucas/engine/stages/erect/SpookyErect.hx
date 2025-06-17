package engine.stages.erect;

import engine.VsliceOptions;


class SpookyErect extends BaseStage
{
    var bgtrees:BGSprite;
	var bg:BGSprite;
    var stairs:BGSprite;
	
}
		var bgtrees:BGSprite = new BGSprite('erect/bgtrees', 190, 30, 0.85);
		add(bgtrees);

        var bg:BGSprite = new BGSprite('erect/bgDark', -360, -220,);
		add(bg);

        var stairs:BGSprite = new BGSprite('erect/stairsDark', 966, -225,);
		add(stairs);