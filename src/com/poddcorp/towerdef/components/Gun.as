package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * Gun class for each Tower created
	 * 
	 */
	public class Gun 
	{
		//Declare global variable to determine if gun is shooting
		public var shooting:Boolean = false;
		
		//Declare global variable for position of gun
		public var offsetTower:Point;
		
		//Declare global variable for determining the last time the tower shoot
		public var timeSinceLast:Number = 0;
		
		//Declare global variable for interval for shooting
		public var shotInterval:Number = 0;
		
		//Declare global variable for the life of bullet or duration of bullet
		public var bulletLifeTime:Number = 0;
		
		/**
		 * Sets a position for gun, shooting interval, and the bullet time.
		 * @param	offset	Position point of the gun
		 * @param	shotInterval	Interval before shooting again
		 * @param	bulletLifeTime	Bullet life time if nothing is hit
		 */
		public function Gun(offset:Point, shotInterval:Number, bulletLifeTime:Number) 
		{
			//sets the position of gun to a new point with the value of parameter offset
			offsetTower = new Point(offset.x, offset.y);
			
			//sets local shotInterval variable to value from parameter
			this.shotInterval = shotInterval;
			
			//sets local bulletLifeTime variable to value from parameter
			this.bulletLifeTime = bulletLifeTime;
		}
		
	}

}