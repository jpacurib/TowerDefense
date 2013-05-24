package com.poddcorp.towerdef.UI
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.media.Sound;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author jans
	 */
	public class ButtonClickTone extends Sprite
	{
		public var _btnTone:Sound = new Sound();
		public var _BtnSound:UIAssets;
		
		
		public function ButtonClickTone()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, gameAddedToStage);
		}
		
		private function gameAddedToStage(e:Event):void
		{
			
			ButtonTone();
			
		
		}
		
		public function ButtonTone():void
		{
			_BtnSound = new UIAssets();
			_btnTone = new (_BtnSound._Btnclick) as Sound
			_btnTone.play();
		
		}
	
	}

}