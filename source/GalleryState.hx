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
    var rightar:FlxSprite;
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

        leftar.x += 270;
        leftar.y = 250;
        leftar.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
        leftar.animation.addByPrefix('idle', "arrow left");
		leftar.animation.addByPrefix('press', "arrow push left");
		leftar.animation.play('idle');
		leftar.antialiasing = ClientPrefs.globalAntialiasing;
        difficultySelectors.add(leftar);
        
        rightar = new FlxSprite(leftar.x + 700, leftar.y);
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
        switch (selected)
        {
            case 0:
                hawk5.visible = false;
                hawk1.visible = true;
                hawk2.visible = false;
                hawk4.visible = false;
                hawk3.visible = false;
            case 1:
                hawk2.visible = true;
                hawk1.visible = false;
                hawk3.visible = false;
                hawk4.visible = false;
                hawk5.visible = false;
            case 2:
                hawk2.visible = false;
                hawk5.visible = false;
                hawk1.visible = false;
                hawk3.visible = true;
                hawk4.visible = false;
            case 3:
                hawk2.visible = false;
                hawk5.visible = false;
                hawk1.visible = false;
                hawk3.visible = false;
                hawk4.visible = true;
                hawk5.visible = false;
            case 4:
                hawk2.visible = false;
                hawk1.visible = false;
                hawk4.visible = false;
                hawk3.visible = false;
                hawk5.visible = true;
                hawk1.visible = false;
            
        }
        function changeSelection(change:Int = 0)
        {
            selected += change;

            if (selected >= 4)
            {
                selected = 0;
            }
            if (selected == -1)
            {
                selected = 4;
            }
        }

        if (FlxG.keys.anyJustPressed([LEFT, A]))
        {
            changeSelection(-1);
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (FlxG.keys.anyJustPressed([RIGHT, D]))
        {
            changeSelection(1);
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (FlxG.keys.anyPressed([LEFT, A]))
        {
            leftar.animation.play('press');
        }
        else
        {
            leftar.animation.play('idle');
        }
        if (FlxG.keys.anyPressed([RIGHT, D]))
        {
            rightar.animation.play('press');
        }        
        else
        {
            rightar.animation.play('idle');
        }
        if (FlxG.keys.justPressed.BACKSPACE)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
    }
}