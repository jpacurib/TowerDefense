package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletView extends Sprite implements ITileView
	{
		private var bullet:Image;
		
		public function BulletView() 
		{			
			bullet = new Image(UIAssets.getUITexture("arrow"));
			addChild(bullet);
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			
		}
		
	}

}