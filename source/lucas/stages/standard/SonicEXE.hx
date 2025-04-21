package lucas.stages.standard;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

class SonicEXE extends BaseStage
{
    var BGSky:BGSprite;
    var rating:FlxSprite;

    override function create()
    {
        // Adiciona o fundo do stage
        BGSky = new BGSprite('Stages/Too Slow/NEWBGSKY', -816, -386, 1, 1.2);
        add(BGSky);

        super.create();

        // Adiciona a imagem do combo "Sick!!"
        rating = new FlxSprite(600, 300).loadGraphic(Paths.image('stages/Too Slow/UI/Combo/sick'));
        rating.scrollFactor.set(0, 0); // Garante que o sprite não se mova com o background
        rating.scale.set(0.8, 0.8); // Ajusta o tamanho da imagem
        add(rating);
    }   
}