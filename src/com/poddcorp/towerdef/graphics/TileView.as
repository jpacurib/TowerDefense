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
		
		//Used Sprite
		/*private var myTile:Shape = new Shape();
		
		public function TileView() 
		{
			//super(UIAssets.getUITexture("iso_tile");
			
			myTile.graphics.beginFill(0x00FF00, .4);
			myTile.graphics.drawRect(0, 0, 50, 50);
			myTile.graphics.endFill();
			
			var bmpData:BitmapData = new BitmapData(myTile.width, myTile.height);
			bmpData.draw(myTile);
			
			this.addChild(new Image(Texture.fromBitmapData(bmpData)));
		}*/
	}

}