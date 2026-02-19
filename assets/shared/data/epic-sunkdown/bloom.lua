function onCreatePost()
	if shadersEnabled == true then
	initLuaShader("bloom")
	makeLuaSprite("bloom")
	makeGraphic("bloom", screenWidth, screenHeight)
	setSpriteShader("bloom", "bloom")

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("bloom").shader)/*, new ShaderFilter(game.getLuaObject("bloom").shader)*/]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("bloom").shader)]);
	]])
	end
end