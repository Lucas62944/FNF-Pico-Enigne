timesended = 0
startcount = false
endedvideo = false
debug = false
-- thanks windows destruction
function onStartCountdown()

       if not seenCutscene and debug == false then
            timesended = timesended + 1

            if timesended == 1 and not endedvideo then
                startVideo('Conscience');
                runTimer("countdown", 13)
                endedvideo = true;
            end

            if startcount or debug == true then
                return Function_Continue;
            else
                return Function_Stop;
            end
        else
            return Function_Continue
        end
end

function onCreate()
setProperty("boyfriend.visible", false);
setProperty("gf.visible", false);
setProperty("dad.visible", true);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == "countdown" then
        startcount = true
        startCountdown()
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
    ]])
    end
end


function onUpdate(elapsed)
    setShaderFloat("shaderImage", "iTime", os.clock())
end