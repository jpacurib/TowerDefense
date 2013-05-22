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
		
		public function Gun(offsetX:Number, offsetY:Number, shotInterval:Number, bulletLifeTime:Number) 
		{
			offsetTower = new Point(offsetX, offsetY);
			this.shotInterval = shotInterval;
			this.bulletLifeTime = bulletLifeTime;
		}
		
	}

}