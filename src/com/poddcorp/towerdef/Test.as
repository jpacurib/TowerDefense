package com.poddcorp.towerdef 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jeremy
	 */
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="0x000000")]
	public class Test extends Sprite
	{
		private var _ash:TowerDefense;
		
		public function Test() 
		{
			init();
		}
		
		private function init():void 
		{
			_ash = new TowerDefense();
			_ash.start();
		}		
	}

}