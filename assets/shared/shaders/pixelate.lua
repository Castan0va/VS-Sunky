function onCreatePost()
	if (shadersEnabled) then
		makeLuaSprite('retro')
		makeGraphic('retro',screenWidth,screenHeight,'000000')
		setSpriteShader('retro','pixelate')
      	addHaxeLibrary('ShaderFilter', 'openfl.filters')
		runHaxeCode([[
		trace(ShaderFilter);
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("retro").shader)]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("retro").shader)]);
		game.camOther.setFilters([new ShaderFilter(game.getLuaObject("retro").shader)]);
      	]])
	end
end