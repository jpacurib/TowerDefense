package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.BulletCollisionNode;
	import com.poddcorp.towerdef.nodes.MonsterCollisionNode;
	import com.poddcorp.towerdef.nodes.TileRenderNode;
	import com.poddcorp.towerdef.nodes.TowerNode;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class CollisionSystem //extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.BulletCollisionNode")]
		public var bullets:NodeList; 
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.MonsterCollisionNode")]
		public var monsters:NodeList;
		
		override public function update(time:Number):void
		{
			var bullet:BulletCollisionNode;
			var monster:MonsterCollisionNode;
			
			for (bullet = bullets.head; bullet; bullet = bullet.next)
			{
				for (monster = monsters.head; monster; monster = monster.next)
				{
					if (Point.distance(monster.position.position, bullet.position.position) < monster.collision.radius)
					{
						//creator.destroyEntity(bullet.entity);
						//creator.destroyEntity(monster.entity);
						trace("hit");
						break;
					}
				}
			}
		}
		
	}

}