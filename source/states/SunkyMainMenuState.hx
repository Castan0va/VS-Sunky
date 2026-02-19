package states;

import flixel.FlxObject;
import options.OptionsState;
import states.StoryMenuState;
import states.FreeplayState;
import states.editors.MasterEditorMenu;

class SunkyMainMenuState extends MusicBeatState {

    var bg:FlxSprite;
    var storyMode:FlxSprite;
    var freeplay:FlxSprite;
    var credits:FlxSprite;
    var options:FlxSprite;
    var squeakBox:FlxSprite;

    var camTarget:FlxObject;

    var selectedSomethin:Bool = false;

    var scroll:Float;
    var zoom:Float;

    override function create(){

        super.create();

        DiscordClient.changePresence("In the Menus", null);
        FlxG.mouse.visible = true;
        camTarget = new FlxObject(0, 0);
        FlxG.camera.follow(camTarget);

        scroll = 0.25;
        zoom = 0.72;

        bg = new FlxSprite(-470, -270).loadGraphic(Paths.image('mainmenu/bg'));
        bg.scale.set(zoom, zoom);
        bg.scrollFactor.set(scroll, scroll);
        bg.antialiasing = ClientPrefs.data.antialiasing;
        add(bg);

        storyMode = new FlxSprite(25, 217);
        storyMode.frames = Paths.getSparrowAtlas('mainmenu/menuOptions');
		storyMode.animation.addByPrefix('idle', "storyMode idle", 24);
		storyMode.animation.addByPrefix('selected', "storyMode selected", 24);
		storyMode.animation.play('idle');
        storyMode.scale.set(zoom, zoom);
        storyMode.updateHitbox();
        storyMode.scrollFactor.set(scroll, scroll);
        storyMode.antialiasing = ClientPrefs.data.antialiasing;
        add(storyMode);

        freeplay = new FlxSprite(-155, -120);
        freeplay.frames = Paths.getSparrowAtlas('mainmenu/menuOptions');
		freeplay.animation.addByPrefix('idle', "freeplay idle", 24);
		freeplay.animation.addByPrefix('selected', "freeplay selected", 24);
		freeplay.animation.play('idle');
        freeplay.scale.set(zoom, zoom);
        freeplay.updateHitbox();
        freeplay.scrollFactor.set(scroll, scroll);
        freeplay.antialiasing = ClientPrefs.data.antialiasing;
        add(freeplay);

        credits = new FlxSprite(520, -75);
        credits.frames = Paths.getSparrowAtlas('mainmenu/menuOptions');
		credits.animation.addByPrefix('idle', "credits idle", 24);
		credits.animation.addByPrefix('selected', "credits selected", 24);
		credits.animation.play('idle');
        credits.scale.set(zoom, zoom);
        credits.updateHitbox();
        credits.scrollFactor.set(scroll, scroll);
        credits.antialiasing = ClientPrefs.data.antialiasing;
        add(credits);

        options = new FlxSprite(630, 280);
        options.frames = Paths.getSparrowAtlas('mainmenu/menuOptions');
		options.animation.addByPrefix('idle', "options idle", 24);
		options.animation.addByPrefix('selected', "options selected", 24);
		options.animation.play('idle');
        options.scale.set(zoom, zoom);
        options.updateHitbox();
        options.scrollFactor.set(scroll, scroll);
        options.antialiasing = ClientPrefs.data.antialiasing;
        add(options);

        squeakBox = new FlxSprite(35, 401);
        squeakBox.makeGraphic(9, 19, 0xFFFF0000);
        squeakBox.alpha = 0;
        squeakBox.angle = 35;
        squeakBox.updateHitbox();
        squeakBox.scrollFactor.set(scroll, scroll);
        add(squeakBox);
    }

    override function update(elapsed:Float){
        camTarget.setPosition((FlxG.mouse.x + 50)/ 5, (FlxG.mouse.y - 50)/ 5);

        if (FlxG.mouse.overlaps(storyMode) && !FlxG.mouse.overlaps(squeakBox)&& !selectedSomethin){
            storyMode.animation.play('selected');
            if (FlxG.mouse.justPressed){
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));
                MusicBeatState.switchState(new StoryMenuState());
            }
        }
        else{
            storyMode.animation.play('idle');
        }
        if (FlxG.mouse.overlaps(freeplay)&& !selectedSomethin){
            freeplay.animation.play('selected');
            if (FlxG.mouse.justPressed){
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));
                MusicBeatState.switchState(new FreeplayState());
            }
        }
        else{
            freeplay.animation.play('idle');
        }
        if (FlxG.mouse.overlaps(credits)&& !selectedSomethin){
            credits.animation.play('selected');
            if (FlxG.mouse.justPressed){
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));
                MusicBeatState.switchState(new CreditsState());
            }
        }
        else{
            credits.animation.play('idle');
        }
        if (FlxG.mouse.overlaps(options)&& !selectedSomethin){
            options.animation.play('selected');
            if (FlxG.mouse.justPressed){
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));
                MusicBeatState.switchState(new OptionsState());
				OptionsState.onPlayState = false;
				if (PlayState.SONG != null)
				{
					PlayState.SONG.arrowSkin = null;
					PlayState.SONG.splashSkin = null;
					PlayState.stageUI = 'normal';
				}
            }
        }
        else{
            options.animation.play('idle');
        }

        if (controls.BACK){
		FlxG.sound.play(Paths.sound('cancelMenu'));
		MusicBeatState.switchState(new TitleState());
	    }

        if (controls.justPressed('debug_1') && !selectedSomethin){
			selectedSomethin = true;
			FlxG.mouse.visible = false;
			MusicBeatState.switchState(new MasterEditorMenu());
		}

        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(squeakBox)){
            FlxG.sound.play(Paths.sound('squeak'));
        }

        super.update(elapsed);
        
    }
}