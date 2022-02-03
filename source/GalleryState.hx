package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import lime.utils.Assets;

class GalleryState extends MusicBeatState
{   
    var difficultySelectors = new FlxGroup();
    var selected:Int = 0;
    var leftar:FlxSprite = new FlxSprite(0, 0);
    var rightar:FlxSprite = new FlxSprite(0, 0);
    var hawk1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/hawk1'));
    var hawk2:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/hawk2'));
    var hawk3:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/hawk3'));
    var hawk4:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/hawk4'));
    var hawk5:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/hawk5'));
    var bekfast1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/bekfast1'));
    var gray1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/gray1'));
    var mask1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/mask1'));
    var skullz1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('fanart/skullz1'));
    override function create()
    {   
        #if desktop
		DiscordClient.changePresence("In the Menus", null);
		#end

		var galbg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('gallery/BG'));
		galbg.updateHitbox();
		galbg.screenCenter();
		galbg.antialiasing = ClientPrefs.globalAntialiasing;
        add(galbg);

        var lightshit:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('gallery/Galfront'));
        lightshit.updateHitbox();
        lightshit.screenCenter();
        lightshit.antialiasing = ClientPrefs.globalAntialiasing;
        add(lightshit);

		add(difficultySelectors);

        leftar.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
        leftar.animation.addByPrefix('idle', "arrow left");
		leftar.animation.addByPrefix('press', "arrow push left");
		leftar.animation.play('idle');
		leftar.antialiasing = ClientPrefs.globalAntialiasing;
        difficultySelectors.add(leftar);

        rightar.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
        rightar.animation.addByPrefix('idle', "arrow right");
		rightar.animation.addByPrefix('press', "arrow push right");
		rightar.animation.play('idle');
		rightar.antialiasing = ClientPrefs.globalAntialiasing;
        difficultySelectors.add(rightar);

        hawk1.updateHitbox();
        hawk1.screenCenter();
        hawk1.visible = false;
        hawk1.antialiasing = ClientPrefs.globalAntialiasing;
        add(hawk1);

        hawk2.updateHitbox();
        hawk2.screenCenter();
        hawk2.visible = false;
        hawk2.antialiasing = ClientPrefs.globalAntialiasing;
        add(hawk2);

        hawk3.updateHitbox();
        hawk3.screenCenter();
        hawk3.visible = false;
        hawk3.antialiasing = ClientPrefs.globalAntialiasing;
        add(hawk3);

        hawk4.updateHitbox();
        hawk4.screenCenter();
        hawk4.visible = false;
        hawk4.antialiasing = ClientPrefs.globalAntialiasing;
        add(hawk4);

        hawk5.updateHitbox();
        hawk5.screenCenter();
        hawk5.visible = false;
        hawk5.antialiasing = ClientPrefs.globalAntialiasing;
        add(hawk5);
    }
    override function update(elapsed:Float)
    {
        if (selected == 0)
        {
            hawk1.visible = true;
        }
        else
        {
            hawk1.visible = false;
        }
        if (selected == 1)
        {
            hawk2.visible = true;
        }
        else
        {
            hawk2.visible = false;
        }
        if (selected == 2)
        {
            hawk3.visible = true;
        }
        else
        {
            hawk3.visible = false;
        }
        if (selected == 3)
        {
            hawk4.visible = true;
        }
        else
        {
            hawk4.visible = false;
        }
        if (selected == 4)
        {
            hawk5.visible = true;
        }
        else
        {
            hawk5.visible = false;
        }
        if (FlxG.keys.anyJustPressed([LEFT, A]))
        {
            selected -=1;
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (FlxG.keys.anyJustPressed([RIGHT, D]))
        {
            selected +=1;
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (FlxG.keys.justPressed.BACKSPACE)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
    }
}