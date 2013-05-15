package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterMotion 
	{
		public var velocity : Point = new Point();
	
		public function MonsterMotion(velocityX:Number, velocityY:Number) 
		{
			velocity = new Point(velocityX, velocityY);
		}
		
	}

}