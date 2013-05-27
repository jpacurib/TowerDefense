package com.poddcorp.towerdef.components 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Gun 
	{
		public var shooting:Boolean = false;
		public var offsetTower:Point;
		public var timeSinceLast:Number = 0;
		public var shotInterval:Number = 0;
		public var bulletLifeTime:Number = 0;
		
		public function Gun(offset:Point, shotInterval:Number, bulletLifeTime:Number) 
		{
			offsetTower = new Point(offset.x, offset.y);
			this.shotInterval = shotInterval;
			this.bulletLifeTime = bulletLifeTime;
		}
		
	}

}