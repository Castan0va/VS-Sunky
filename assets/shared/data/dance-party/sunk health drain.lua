function onCreate()
	makeAnimatedLuaSprite('lilsunk', 'UI/sunkBaby', -600, -300, 0, 0)
	setProperty('lilsunk.y',getProperty('iconP1.y')-40)
	addAnimationByPrefix('lilsunk', 'clickpull', 'clickpull', 12, true)
	addAnimationByPrefix('lilsunk', 'click1', 'click1', 12, false)
	addAnimationByPrefix('lilsunk', 'click2', 'click2', 12, false)
	addAnimationByPrefix('lilsunk', 'clickded', 'clickded', 12, false)
	setObjectCamera('lilsunk', 'hud')
	addLuaSprite('lilsunk', true)
	doTweenAlpha('lilsunkstart', 'lilsunk', 0, 0.000001, 'linear')
	setGraphicSize('lilsunk',150,150)
	lilsunkhealth = 0
	hp = getProperty('health');
end

function onEvent(name, value1, value2)
	if name == 'sunk health drain' then
		playAnim('lilsunk', 'clickpull', true)
		lilsunkhealth = 3
		doTweenAlpha('lilsunkhi', 'lilsunk', 1, 0.75, 'linear')
	end
end

function onUpdate(elapsed)
	setProperty('lilsunk.x',getProperty('iconP1.x')+120)

	if mouseOverlaps('lilsunk', 'camHUD') and mouseClicked('left') then
		if lilsunkhealth == 1 then
			lilsunkhealth = 0
			playAnim('lilsunk', 'clickded', true)
			runTimer('die', 0.25, 1)
		elseif lilsunkhealth == 2 then
			lilsunkhealth = 1
			playAnim('lilsunk', 'click2', true)
		elseif lilsunkhealth == 3 then
			lilsunkhealth = 2
			playAnim('lilsunk', 'click1', true)
		end
	end
end

function onTimerCompleted(tag) 
	if tag  == 'die' then
		doTweenAlpha('lilsunkbye', 'lilsunk', 0, 0.75, linear)
	end
end

function mouseOverlaps(obj, camera)
    local mX = getMouseX(camera or 'camHUD') + getProperty(camera .. '.scroll.x')
    local mY = getMouseY(camera or 'camHUD') + getProperty(camera .. '.scroll.y')
    local x = getProperty(obj .. '.x')
    local y = getProperty(obj .. '.y')
    local width = getProperty(obj .. '.width')
    local height = getProperty(obj .. '.height')
    return (mX > x) and (mX < x + width) and (mY > y) and (mY < y + height)
end

function onStepHit()
	--for every beat
	if lilsunkhealth > 0 and getProperty('health') > 0.1 then
	health = getProperty('health')
		setProperty('health', health- 0.02);
	end
end