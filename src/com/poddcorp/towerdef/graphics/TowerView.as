package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerView extends Sprite implements ITileView
	{
		private var tower:Image;
		private var direction:String;
		
		public function TowerView() {
			tower = new Image(UIAssets.getAtlas().getTexture("img_Coin"));
			this.addChild(tower);
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			
		}
		
	}

}