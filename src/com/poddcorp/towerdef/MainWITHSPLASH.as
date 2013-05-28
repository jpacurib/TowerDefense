package com.poddcorp.towerdef
{
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SWFVersion;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import flash.display.Sprite;
	import flash.desktop.NativeApplication;
	import flash.geom.Rectangle;
	import flash.ui.MultitouchInputMode;
	import flash.ui.Multitouch;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="2048",height="1538",frameRate="60",backgroundColor="#FFFFFF")]
	
	public class Main extends MovieClip
	{
		
		//[Embed(source="../../../../assets/podd.png")]
		[Embed(source="../../../../lib/splash_logo.swf",mimeType="application/octet-stream")]
		private var mypodd:Class;
		private var loader:Loader = new Loader();
		private var _starlingApp:Starling;
		private var _timer:Timer;
		
		public function Main():void
		
		{
			super();
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event = null):void
		
		{
			_timer = new Timer(2000, 1);
			_timer.addEventListener(TimerEvent.TIMER, onAddedToStage);
			_timer.start();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onGameLoaded);
			loader.loadBytes(new mypodd());
			addChild(loader);
		
		}
		
		private function onGameLoaded(e:Event):void
		{
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onAddedToStage);
		
		}
		
		private function onAddedToStage(event:TimerEvent):void
		{
			//   Init Starling
			if (stage.stageWidth && stage.stageHeight)
			{
				
				loader.unloadAndStop();
				removeChild(loader);
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				stage.addEventListener(Event.DEACTIVATE, deactivate);
				
				Starling.multitouchEnabled = true;
				//useful on mobile devices
				Starling.handleLostContext = false;
				// not necessary on iOS. Saves a lot of memory!
				
				//touch or gesture?2
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				
				var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
				if (viewPort.width == 768) // iPad 1+2
					viewPort.setTo(64, 32, 640, 960);
				else if (viewPort.width == 1536) // iPad 3
					viewPort.setTo(128, 64, 1280, 1920);
				
				//entry point
				trace("Starting Mobile App");
				_starlingApp = new Starling(TowerDefense, stage, viewPort);
				_starlingApp.simulateMultitouch = false;
				_starlingApp.enableErrorChecking = false;
				_starlingApp.showStats = true;
				_starlingApp.antiAliasing = 0;
				_starlingApp.start();
				
			}
		}
		
		private function deactivate(e:Event):void
		{
			//auto-close
			// NativeApplication.nativeApplication.exit();
		}
	}

}