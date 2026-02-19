function onEvent(name, value1, value2)
	if name == 'hide ui' then
	doTweenAlpha('bye1', 'scoreTxt', value1, value2)
	doTweenAlpha('bye2', 'healthBar', value1, value2)
	doTweenAlpha('bye3', 'healthBarBG', value1, value2)
	doTweenAlpha('bye4', 'iconP1', value1, value2)
	doTweenAlpha('bye5', 'iconP2', value1, value2)
	doTweenAlpha('bye6', 'timeTxt', value1, value2)
	--doTweenAlpha('bye7', 'timeBar', value1, value2)
	--doTweenAlpha('bye8', 'timeBarBG', value1, value2)
	doTweenAlpha('bye9', 'health', value1, value2)
	end
end