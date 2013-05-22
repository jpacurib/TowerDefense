package com.poddcorp.towerdef.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerView extends Sprite implements ITileView
	{
		public function TowerView() {
			var s:Shape = new Shape;
			s.graphics.beginFill(0xFF0000);
			s.graphics.drawRect(0, 0, 45, 45);
			s.graphics.endFill();
			
			var btmp:BitmapData = new BitmapData(s.width, s.height);
			btmp.draw(s);
			
			this.addChild(new Image(Texture.fromBitmapData(btmp)));
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			
		}
		
	}

}