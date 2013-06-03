package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.BulletAgeNode;
	/**
	 * Bullet Age System is responsible for destroying bullet after a duration
	 * 
	 */
	public class BulletAgeSystem extends System
	{
		//Gets instance of EntityCreator and stores it to creator variable as NodeList
		[Inject]
		public var creator:EntityCreator;
		
		//Gets instance of BulletAgeNode and stores to bullets variable as NodeList
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.BulletAgeNode")]
		public var bullets:NodeList;
		
		override public function update(time:Number):void
		{
			//Declares node variable as BulletAgeNode
			var node:BulletAgeNode;
			
			//Declares bullet as Bullet Component
			var bullet:Bullet;
			
			for (node = bullets.head; node; node = node.next)
			{
				//Sets bullet variable to bullet in node
				bullet = node.bullet;
				
				//Sets life remaining of bullet every time the time parameter change
				bullet.lifeRemaining -= time;
				
				//Checks if the bullet life remaining is lesser than or equal to zero
				if (bullet.lifeRemaining <= 0)
				{
					//Destroys bullet entity
					creator.destroyEntity(node.entity);
				}
			}
		}
		
	}

}