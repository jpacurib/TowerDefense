package com.poddcorp.towerdef.components 
{
	/**
	 * Monster class for each entity created
	 * 
	 * 
	 */
	public class Monster 
	{
		//Declare global variable for life of monster
		public var life:Number;
		
		/**
		 * Sets life variable to specific value
		 * @param	life	Life of monster
		 */
		public function Monster(life:Number)
		{
			this.life = life;
		}
	}

}