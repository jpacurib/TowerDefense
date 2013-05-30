package com.poddcorp.towerdef.components 
{
	/** 
	* Bullet Class
	* 
	*/
	public class Bullet 
	{
		//Creates a variable or a holder for bullet life for every bullet. Number in data type.
		public var lifeRemaining:Number;
		
		/* 
		 * Creates a new lifetime in every bullet.
		 * 
		 * @param	lifetime	Accepts a number for lifetime value and sets value of lifeRemaining to value of parameter.
		 * 
		 */
		public function Bullet(lifetime:Number) 
		{
			//Sets lifeRemaining to value of lifetime parameter.
			lifeRemaining = lifetime;
		}
		
	}

}