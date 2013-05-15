package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileView extends Image
	{
		
		public function TileView()
		{
			super(UIAssets.getUITexture("tile"));
			this.touchable = true;
			
		}
		
	}

}