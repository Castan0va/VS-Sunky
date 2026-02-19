function onCreate()
	makeLuaSprite('back', 'stages/mpeg/partyback' ,-600,-300) -- the 2 ending numbers are x,y coordinates
	makeLuaSprite('ground', 'stages/mpeg/partyfloor',-570,-200)
 	makeLuaSprite('ball', 'stages/mpeg/discoball' ,-560,-100)
	makeLuaSprite('overlay', 'stages/mpeg/partyoverlay' ,-500,-230)
	makeLuaSprite('black', '' ,-500,-230)
	makeGraphic('black', 2000, 1000, '000000')
	makeAnimatedLuaSprite('speakers', 'stages/mpeg/partyspeakers', -600, -190, 0, 0)
	addAnimationByPrefix('speakers', 'idle', 'idle', 12, false)
	makeAnimatedLuaSprite('lightpull', 'stages/mpeg/lightpull', 280, 0, 0, 0)
	addAnimationByPrefix('lightpull', 'light pull', 'light pull', 12, false)

	setScrollFactor('speakers',1.07,1.07)
	setScrollFactor('ball',1.15,1.15)
	setScrollFactor('overlay',1.15,1.15)

	setGraphicSize('back',2800,1500)
	setGraphicSize('overlay',2800,1500)
	setGraphicSize('speakers',2400,1350)
	setGraphicSize('ball',2400,1350)
	setGraphicSize('ground',2400,1350)
	setGraphicSize('black',4000,4000)

	addLuaSprite('back', false)
	addLuaSprite('speakers', false)
	addLuaSprite('ground', false)
	addLuaSprite('ball', false) 
	addLuaSprite('overlay', true) 
	addLuaSprite('black', false)
	addLuaSprite('lightpull', true)

	setObjectCamera('lightpull', 'hud')

	makeLuaSprite('borderL', '' ,-10, -10)
    makeLuaSprite('borderR', '' ,1120, -10)
	makeGraphic('borderL', 160, 740, '000000')
	makeGraphic('borderR', 170, 740, '000000')

    setObjectCamera('borderL', 'hud')
    setObjectCamera('borderR', 'hud')

    addLuaSprite('borderL', true)
    addLuaSprite('borderR', true)
end

function onBeatHit()
	playAnim('speakers', 'idle')
end

function onCreatePost()
	noteTweenX("correction1", 4, 670, 0.1, linear)
	noteTweenX("correction2", 5, 780, 0.1, linear)
	noteTweenX("correction3", 6, 890, 0.1, linear)
	noteTweenX("correction4", 7, 1000, 0.1, linear)
	doTweenAlpha('overlaybye', 'overlay', 0, 0.01, linear)
	doTweenAlpha('ballbye', 'ball', 0, 0.01, linear)
	for i = 0, 3 do
		setPropertyFromGroup('playerStrums', i, 'visible', false)
		setPropertyFromGroup('opponentStrums', i, 'visible', false)
	end
	runHaxeCode([[
		FlxG.mouse.visible = true;
	]])
end

function onStepHit()
	if curStep == 6 then
		setProperty('scoreTxt.visible', false)
		setProperty('healthBar.visible', false) -- change this & next 3 to true if u want health
		setProperty('healthBar2.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('timeTxt.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('health.visible', false)
    end
	if curStep == 101 then
		playAnim('lightpull', 'light pull')
	end
	if curStep == 112 then
		doTweenAlpha('blackbye', 'black', 0, 0.01, linear)
		doTweenAlpha('overlayhi', 'overlay', 1, 0.01, linear)
		doTweenAlpha('ballhi', 'ball', 1, 0.01, linear)

		setProperty('scoreTxt.visible', true)
        setProperty('healthBar.visible', true)
		setProperty('healthBarBG.visible', true)
		setProperty('healthBar2.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('timeTxt.visible', true)
        setProperty('timeBar.visible', true)
        setProperty('timeBarBG.visible', true)

        for i = 0, 3 do
		setPropertyFromGroup('playerStrums', i, 'visible', true)
		setPropertyFromGroup('opponentStrums', i, 'visible', true)
		end
	end
end