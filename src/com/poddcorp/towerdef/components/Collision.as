package com.poddcorp.towerdef.components 
{
	/**
	 * Collision class will accept a radius for object collision between two objects.
	 */
	public class Collision 
	{
		//creates a radius variable that accepts a number.
		public var radius:Number = 0;
		
		/**
		 * Every object with collision needs a radius to check if two objects are colliding.
		 * @param	radius	Radius of the object.
		 */
		public function Collision(radius:Number)
		{
			//Sets local radius value to the value of accepted parameter.
			this.radius = radius;
		}
		
	}

}