package com.poddcorp.towerdef.graphics 
{
	import flash.display.Shape;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletView extends Shape
	{
		
		public function BulletView() 
		{
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(0, 0, 4);
			graphics.endFill();
		}
		
	}

}