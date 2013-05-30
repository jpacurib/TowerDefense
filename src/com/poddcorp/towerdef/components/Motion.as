package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * Motion class holds the velocity/motion for every monster created by entity creator.
	 *
	 */
	public class Motion 
	{
		//Declares velocity as a new point for storing horizontal and vertical speed
		public var velocity : Point = new Point();
	
		/**
		 * Sets velocity/motion of each monster with Motion class.
		 * @param	velocityX	Horizontal speed.
		 * @param	velocityY	Vertical speed.
		 */
		public function Motion(velocityX:Number, velocityY:Number) 
		{
			//Sets value of velocity to a new point with value of parameter 1 and 2.
			velocity = new Point(velocityX, velocityY);
		}
		
	}

}