package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	private static var creditsStuff:Array<Dynamic> = [ //Name - Icon name - Description - Link - BG Color
		['SPSD Team'],
		['__Hawk',		'hawk',		'Director, Main composer, charter,\n writer and voice actor',						'https://twitter.com/__Hawkreal',	0xFFFFFFFF],
		['Nightmar',			'mar',		'Main Artist/Animator, Programmer',					'https://www.youtube.com/channel/UCDMyyI8_pcSHUO4i-3AjmYA',		0xFF25252D],
		['Daisy',			'daisy',			'Programmer, animator and charter for (secret song)',				'https://twitter.com/Daisythatpeep',			0xFFE9B8FF],
		['MrChompsAlot',			'chart',			'Main charter',				'https://twitter.com/MrChompsALot',			0xFF61E561],
		['CactusCommander4',			'toddler',			'Charter',				'https://www.youtube.com/channel/UCoAFILvyTFT4NKZ4p0oD7cA',			0xFF73F08B],
		['Ikcz',			'ikcz',			'Main animator',				'Sorry no socials :(',			0xFF0099FF],
		['Speedy',			'speed',			'Composer and voice actor',				'https://www.youtube.com/c/SpeedyGarageBandMusic',			0xFFEB4848],
		['Fuunkyy',			'funk',			'Composer',				'https://www.youtube.com/channel/UCusnMhMxR8vJEh0sLmDT1wg',			0xFF70C4FF],
		['Micasddsa.sf2',			'mica',			'Soundfounts',				'https://soundcloud.com/micasddsa',			0xFF6398FF],
		['NyanCreator',			'sylvie',			'Writer and Voice actor',				'https://www.twitch.tv/nyancreator',			0xFFFF8FA6],
		['Charred',			'char',			'Voice actor',				'https://twitter.com/Charles57778375',			0xFFEB4848],
		['Social media lol'],
		['Discord',		'discord',		 "Just hawk's discord, join it, pls i'm begging you\nwe leak spsd shit there too",			'https://discord.gg/WYHjkC6jPm',		0xFF5165F6],
		[''],
		['Special thanks'],
		['Ejr404',			'gray',			'Gray va',				'https://www.youtube.com/watch?v=dQw4w9WgXcQ',			0xFF343643],
		['Skullz914',	'skullz',		'Skullz va',		'https://www.youtube.com/watch?v=dQw4w9WgXcQ',		0xFF5AB025],
		['Cool people list'],
		['Mysticmegga', 'Void', 'gag', 'https://twitter.com/mysticmegga', 0xFFFDE871],
		['Renapti', 'Void', 'gag', 'https://twitter.com/renapti', 0xFFFDE871],
		['eyy_man', 'Void', 'gag', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 0xFFFDE871],
		['Smazajack ', 'Void', 'gag', 'https://twitter.com/Smaza16', 0xFFFDE871],
		['some_random_proto ', 'Void', 'ungag', 'https://twitter.com/SomeRandomProto', 0xFFFDE871],
		['Twili_Ink', 'Void', 'gag', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 0xFFFDE871],
		['Void_cube', 'Void', ':)', 'https://twitter.com/void_cube', 0xFFFDE871],
		['Magggg', 'Void', 'gag', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 0xFFFDE871],
		['Cactuarcity', 'Void', 'gag', 'https://www.youtube.com/channel/UC0rmzTc5kTNRaMbgoZnmCRg', 0xFFFDE871],
		['Benlab Crimson', 'Void', 'gag', 'https://twitter.com/BenlabD', 0xFFFDE871],
		['Invis', 'Void', 'gag', 'https://twitter.com/ICat0091', 0xFFFDE871],
		['Fizz_Crack', 'Void', 'gag', 'https://twitter.com/fizz_crack', 0xFFFDE871],
		['LacerSpacer', 'Void', "hi i'm lacer", 'https://twitter.com/LaceSpace1', 0xFFFDE871],
		['UnderBlunder', 'Void', 'thanks for letting Hawk chart for deltafunk ;)', 'https://twitter.com/heisenblunder', 0xFFFDE871],
		['Juelz', 'Void', 'thanks for letting Hawk chart for deltafunk ;)', 'https://twitter.com/MistaCompose2', 0xFFFDE871],
		['WassabiSoja', 'Void', 'gag', 'https://twitter.com/WassabiSoja', 0xFFFDE871],
		['spice individual', 'Void', 'gag', 'https://twitter.com/spiciii_', 0xFFFDE871],
		['whathead07', 'Void', 'gag', 'https://twitter.com/whathead07', 0xFFFDE871],
		['Simply Ej', 'Void', 'cool asset pack used to make spsd bf', 'https://twitter.com/ESimplyJ', 0xFFFDE871],
		['StickyBM', 'Void', "no way is that sticky he's so cool", 'https://twitter.com/StickyBM', 0xFFFDE871],
		['Flippy', 'Void', 'thanks for playing the Static Nightmare Demo :)', 'https://twitter.com/FlippyTheReal', 0xFFFDE871],
		[''],
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	0xFFFFDD33],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		0xFFC30085],
		[''],
		['Engine Contributors'],
		['shubs',				'shubs',			'New Input System Programmer',						'https://twitter.com/yoshubs',			0xFF4494E6],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	0xFFE01F32],
		['gedehari',			'gedehari',			'Chart Editor\'s Sound Waveform base',				'https://twitter.com/gedehari',			0xFFFF9300],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			0xFFFFFFFF],
		['SandPlanet',			'sandplanet',		'Mascot\'s Owner\nMain Supporter of the Engine',		'https://twitter.com/SandPlanetNG',		0xFFD10616],
		['bubba',				'bubba',		'Guest Composer for "Hot Dilf"',	'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',	0xFF61536A],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	0xFFF73838],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	0xFFFFBB1B],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			0xFF53E52C],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		0xFF6475F3]
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
