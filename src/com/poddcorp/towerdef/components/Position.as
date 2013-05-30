package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * Position Class will determine the current location or position of an entity or object with regards to it's direction.
	 * 
	 */
	public class Position 
	{
		//Declares public variable position that will store current X and Y values
		public var position:Point;
		
		//Declares public variable direction as string and will store a value depending on its motion.
		public var direction:String;
		
		/**
		 * Sets position for every entity created with entity creator.
		 * @param	x	Horizontal position of entity.
		 * @param	y	Vertical position of entity.
		 * @param	direction	Direction of entity
		 */
		public function Position(x:Number, y:Number, direction:String) 
		{
			//Sets position value to a new point with parameter 1 and 2 values.
			position = new Point(x, y);
			
			//Sets public variable direction to the value of parameter 3.
			this.direction = direction;
		}
		
	}

}