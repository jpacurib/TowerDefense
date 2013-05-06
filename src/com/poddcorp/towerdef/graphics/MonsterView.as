package com.poddcorp.towerdef.graphics 
{
	import starling.textures.Texture;
	import starling.display.Image;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterView extends Sprite
	{
		public function MonsterView(radius:Number) 
		{
			var angle : Number = 0;
			
			var s:Shape = new Shape();
			s.graphics.beginFill(0xFF0000);
			s.graphics.moveTo(radius, 0);
			while(angle < Math.PI * 2)
			{
				var length : Number = (0.75 + Math.random() * 0.25) * radius;
				var posX : Number = Math.cos(angle) * length;
				var posY : Number = Math.sin(angle) * length;
				s.graphics.lineTo(posX, posY);
				angle += Math.random() * 0.5;
			}
			s.graphics.lineTo(radius, 0);
			s.graphics.endFill();
			
			var bmpData:BitmapData = new BitmapData(s.width, s.height);
			bmpData.draw(s);
			
			this.addChild(new Image(Texture.fromBitmapData(bmpData)));
		}
		
	}

}