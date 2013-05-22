package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Position 
	{
		public var position:Point;
		public var direction:String;
		
		public function Position(x:Number, y:Number, direction:String) 
		{
			position = new Point(x, y);
			this.direction = direction;
		}
		
	}

}