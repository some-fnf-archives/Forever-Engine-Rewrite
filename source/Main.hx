package;

import base.Controls;
import base.ScriptHandler;
import base.debug.Overlay;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Lib;
import openfl.display.Sprite;
import states.MusicBeatState;
import states.PlayState;
import states.ScriptableState;

class Main extends Sprite
{
	public static var initialState:Class<FlxState> = PlayState;
	public static var defaultFramerate:Int = 120;

	public static var engineVersion:String = '1.0.0';

	private final zoom:Float = -1;

	public static function main():Void
		Lib.current.addChild(new Main());

	public function new()
	{
		super();

		// initialize the controls of the engine
		Controls.init();
		// initialize the forever scripthandler
		ScriptHandler.initialize();

		// haxeui stuff
		haxe.ui.Toolkit.init();

		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / 1280;
			var ratioY:Float = stageHeight / 720;
			zoom = Math.min(ratioX, ratioY);
			width = Math.ceil(stageWidth / zoom);
			height = Math.ceil(stageHeight / zoom);
		}

		var gameCreate:FlxGame;
		gameCreate = new FlxGame(1280, 720, Init, #if (flixel < "5.0.0") zoom, #end defaultFramerate, defaultFramerate, true, false);
		addChild(gameCreate);

		var overlay:Overlay;
		overlay = new Overlay(0, 0);
		addChild(overlay);
	}
}
