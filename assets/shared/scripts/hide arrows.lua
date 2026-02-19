function onEvent(name, value1, value2)
	if name == 'hide arrows' then
		noteTweenAlpha('notebye1', 4, value1, value2)
		noteTweenAlpha('notebye2', 5, value1, value2)
		noteTweenAlpha('notebye3', 6, value1, value2)
		noteTweenAlpha('notebye4', 7, value1, value2)
	end
end