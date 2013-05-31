package com.poddcorp.towerdef.systems
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.IsoTile;
	import com.poddcorp.towerdef.nodes.BulletCollisionNode;
	import com.poddcorp.towerdef.nodes.MonsterCollisionNode;
	import com.poddcorp.towerdef.nodes.TileRenderNode;
	import com.poddcorp.towerdef.nodes.TowerNode;
	import com.poddcorp.towerdef.TowerDefense;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class CollisionSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.BulletCollisionNode")]
		public var bullets:NodeList;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MonsterCollisionNode")]
		public var monsters:NodeList;
		
		override public function update(time:Number):void
		{
			var bullet:BulletCollisionNode;
			var monster:MonsterCollisionNode;
			
			for (bullet = bullets.head; bullet; bullet = bullet.next)
			{
				for (monster = monsters.head; monster; monster = monster.next)
				{
					
					if (Point.distance(monster.position.position, bullet.position.position) <= monster.collision.radius)
					{
						monster.monster.life--;
						creator.destroyEntity(bullet.entity);						
					}
					
					if (monster.monster.life == 0)
					{
						
						creator.destroyEntity(monster.entity);
						//creator.createCoin(monster.position);
						
						//creates enemy
						/*if (Math.random() >= 0 && Math.random() <= .2)
						{
							creator.createSkullMonster(startTile);
						}
						
						else if (Math.random() > .2 && Math.random() <= .4)
						{
							creator.createOrcMonster(startTile);
						}
						
						else
						{
							creator.createVoodooMonster(startTile);
						}*/
						
					}
					
				}
			}
		}
	
	}

}