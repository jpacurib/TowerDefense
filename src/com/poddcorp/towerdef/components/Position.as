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
		public var rotation:Number;
		
		public function Position(x:Number, y:Number, rotation:Number) 
		{
			position = new Point(x, y);
			this.rotation = rotation;
		}
		
	}

}