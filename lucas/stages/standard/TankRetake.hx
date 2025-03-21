package lucas.stages.standard;

import states.stages.objects.*;

class TankRetake extends BaseStage {
    override function create(){
        var stage:BGSprite = new BGSprite('Retake/stage', -400, -350, 1.2);
        add(stage);
        
        var filtro:BGSprite = new BGSprite('Retake/filtro', -400, -820, 2, 2);
        add(filtro);

        var niebla:BGSprite = new BGSprite('Retake/niebla', -400, -300,  1,2);
        add(niebla);
    }
    // Ensure animArray is of type Null<Array<String>>
    function someFunction(animArray:Null<Array<String>> = null) {
        // ...existing code...
    }
}