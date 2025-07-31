function onCreatePost()
    if not hideHud then
        addCharacterToList('nene', 'gf')
        addLuaScript('scripts/Extra/extraIcon')
        extraIcon('addExtraIcon', {'gfIcon'})
        setProperty('gfIcon.offset.x', -15)
        setProperty('gfIcon.offset.y', not downscroll and -500 or 500)
    end
end

function extraIcon(func, vars)
    callScript('scripts/Extra/extraIcon', func, vars)
end

function onEvent(name, v1, v2)
    if name == 'Triggers Tutorial-Darnell' then
        callScript('scripts/Extra/extraIcon', 'setIconProperty', {'gfIcon', 'followAlpha', false})
        doTweenAlpha('gfIconAlpha', 'gfIcon', 0, 2, 'cubeIn')
        doTweenX('gfX', 'gf', 5000, 3, 'cubeIn')
        callScript('scripts/Extra/extraIcon', 'setIconProperty', {'gfIcon', 'followAlpha', true})
    end
end
