package com.poddcorp.towerdef.components 
{
	import ash.core.NodeList;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterMotion 
	{
		public var movement:Point = new Point();
		
		public function MonsterMotion(movementX:Number, movementY:Number) 
		{
			movement = new Point(movementX, movementY);
		}
		
	}

}