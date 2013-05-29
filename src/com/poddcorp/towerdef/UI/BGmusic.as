package com.poddcorp.towerdef.UI
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author jans
	 */
	public class BGmusic extends Sprite
	{
		
		public var _bgmusic:Sound = new Sound();
		public var _BgMusic:UIAssets;
		public var _content:SoundChannel;
		
		public function BGmusic()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, gameAddedToStage);
		}
		
		private function gameAddedToStage(e:Event):void
		{
			
			BG_Music()
		
		}
		
		public function BG_Music():void
		{
			_BgMusic = new UIAssets();
			_content = new SoundChannel();
			_bgmusic = new (_BgMusic._BGMySound) as Sound
			if (_content != null)
				_content = _bgmusic.play(0,5);
			else
			{
				_content.stop();
				
			}
		}
	
	}

}