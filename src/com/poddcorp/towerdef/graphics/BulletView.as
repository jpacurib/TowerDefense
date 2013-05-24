package com.poddcorp.towerdef.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletView extends Sprite
	{
		
		public function BulletView() 
		{
			var bullet:Shape = new Shape();
			
			bullet.graphics.beginFill(0xFF0000);
			bullet.graphics.drawCircle(0, 0, 4);
			bullet.graphics.endFill();
			
			var btmp:BitmapData = new BitmapData(bullet.width, bullet.y);
			btmp.draw(bullet);
			
			var image:Image = new Image(Texture.fromBitmapData(btmp));
		}
		
	}

}