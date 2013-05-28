package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.BulletAgeNode;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletAgeSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.BulletAgeNode")]
		public var bullets:NodeList;
		
		override public function update(time:Number):void
		{
			var node:BulletAgeNode;
			var bullet:Bullet;
			
			for (node = bullets.head; node; node = node.next)
			{
				bullet = node.bullet;
				
				bullet.lifeRemaining -= time;
				if (bullet.lifeRemaining <= 0)
				{
					creator.destroyEntity(node.entity);
				}
			}
		}
		
	}

}