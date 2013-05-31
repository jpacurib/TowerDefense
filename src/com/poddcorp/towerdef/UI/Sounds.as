package com.poddcorp.towerdef.UI
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.SharedObject;
	
	import starling.events.Event;
	
	/**
	 * ...
	 * @author jans
	 */
	public class Sounds
	{
		
		public static var _bgmusic:Sound;
		public static var _content:SoundChannel;
		public static var _mytransform:SoundTransform;
		
		public static var _IngameS:Sound;
		public static var _content1:SoundChannel;
		public static var _mytransform1:SoundTransform;
		
		public static function init():void
		{
			_content = new SoundChannel();
			_mytransform = new SoundTransform();
			
			_bgmusic = UIAssets.getSound("BGMySound");
			
			_content = _bgmusic.play(0, 10);
			//_content.soundTransform = mytransform;
		}
		
		public static function SetVolume(val:Number):void
		{
			
			_mytransform.volume = val;
			_content.soundTransform = _mytransform;
		}
		
		
		
		public static function Newinit():void
		{
			_content1 = new SoundChannel();
			_mytransform1 = new SoundTransform();
			_IngameS = UIAssets.getSound("IngameSound");
			_content1 = _IngameS.play(0, 20);
		}
		public static function IngameSound(val:Number):void
		{
			_mytransform1.volume = val;
			_content1.soundTransform = _mytransform1;
		}
		public static function Stopinit():void 
		{
			_content.stop();
		}
		public static function StopNewinit():void 
		{
			_content1.stop();
		}
	
	}

}