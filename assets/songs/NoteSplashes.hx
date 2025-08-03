function onNoteSplashCreation(event)
{
    if (event.noteSplash == null)
        return;

    var splashSprite = event.noteSplash.xml.get("splashsprite");
    if (splashSprite != null)
        event.splashSprite = 'game/splashes/' + splashSprite;
}

function onNoteSplashHit(event)
{
    // Exemplo: mostrar animação de splash
    event.showSplash = true;
}

function onNoteSplashMiss(event)
{
    // Exemplo: esconder splash ou aplicar efeito
    event.showSplash = false;
}