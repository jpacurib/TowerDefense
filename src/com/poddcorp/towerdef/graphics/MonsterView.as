package com.poddcorp.towerdef.graphics 
{
	import flash.display.Shape;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterView extends Shape
	{
		public function MonsterView(radius:Number) 
		{
			var angle : Number = 0;
			graphics.beginFill(0xFF0000);
			graphics.moveTo(radius, 0);
			while(angle < Math.PI * 2)
			{
				var length : Number = (0.75 + Math.random() * 0.25) * radius;
				var posX : Number = Math.cos(angle) * length;
				var posY : Number = Math.sin(angle) * length;
				graphics.lineTo(posX, posY);
				angle += Math.random() * 0.5;
			}
			graphics.lineTo(radius, 0);
			graphics.endFill();
		}
		
	}

}