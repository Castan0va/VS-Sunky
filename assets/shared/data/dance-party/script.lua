function onPause()
	if curStep < 46 then
	return Function_Stop
	end
end

function onCreate()
    setProperty('skipCountdown', true)
    startVideo('supascarywarning');
	makeLuaSprite('black2', '', -100, -100)
	makeGraphic('black2', 1480, 920, '000000')
	setObjectCamera('black2', 'camHUD')
	addLuaSprite('black2', false)
end

function onStepHit()
	if curStep == 46 then
		doTweenAlpha('blackOut', 'black2', 0, 5, 'linear')
	end
end