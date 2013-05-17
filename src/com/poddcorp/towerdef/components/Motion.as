package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Motion 
	{
		public var velocity : Point = new Point();
	
		public function Motion(velocityX:Number, velocityY:Number) 
		{
			velocity = new Point(velocityX, velocityY);
		}
		
	}

}