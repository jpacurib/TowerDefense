package com.poddcorp.towerdef
{
	import flash.desktop.NativeApplication;
	import flash.geom.Rectangle;
	import flash.ui.MultitouchInputMode;
	import flash.ui.Multitouch;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	
	[SWF(width="2048",height="1536",frameRate="60",backgroundColor="#000000")]
	
	public class Main extends Sprite
	{
		private var _starlingApp:Starling;
		
		public function Main():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onResize(event:Event):Void
		{
			Starling.current.viewPort = getViewPort();
			
			// Avoid scaling up the content so adjust the starling instance stage size.
			_starlingApp.stage.stageWidth = stage.stageWidth;
			_starlingApp.stage.stageHeight = stage.stageHeight;
		}
		
		
		private function getViewPort():Rectangle
		{
			var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			if (viewPort.width == 768) // iPad 1+2
				viewPort.setTo(64, 32, 640, 960);
			else if (viewPort.width == 1536) // iPad 3
				viewPort.setTo(128, 64, 1280, 1920);
			else
				viewPort.setTo(0, 0, stage.stageWidth, stage.stageHeight);
			
			return viewPort;
		}
		
		private function onEnterFrame(e:Event):void
		{
			
			if (stage.stageWidth && stage.stageHeight)
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				stage.scaleMode = StageScaleMode.SHOW_ALL;
				stage.align = StageAlign.TOP_LEFT;
				stage.addEventListener(Event.DEACTIVATE, deactivate);
				
				Starling.multitouchEnabled = true;
				// useful on mobile devices
				Starling.handleLostContext = false;
				// not necessary on iOS. Saves a lot of memory!
				
				// touch or gesture?2
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				
				var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
				if (viewPort.width == 768) // iPad 1+2
					viewPort.setTo(64, 32, 640, 960);
				else if (viewPort.width == 1536) // iPad 3
					viewPort.setTo(128, 64, 1280, 1920);
				
				// entry point
				trace("Starting Mobile App");
				_starlingApp = new Starling(GameUI, this.stage, getViewPort());
				_starlingApp.simulateMultitouch = false;
				_starlingApp.enableErrorChecking = false;
				_starlingApp.showStats = true;
				_starlingApp.antiAliasing = 0;
				_starlingApp.start();
				stage.addEventListener(Event.RESIZE, onResize);
			}
			
		}
		
		private function deactivate(e:Event):void
		{
			// auto-close
			//NativeApplication.nativeApplication.exit();
		}
		
		
	}
}