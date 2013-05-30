package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Sprite;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class CoinView extends Sprite implements ITileView
	{
		private var coin:Image;
		public function CoinView() 
		{
			coin = new Image(UIAssets.getAtlas().getTexture("img_Coin"));
			addChild(coin);
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			
		}
		
	}

}