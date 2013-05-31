package com.poddcorp.towerdef.systems
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Gun;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.BulletCollisionNode;
	import com.poddcorp.towerdef.nodes.GunControlNode;
	import com.poddcorp.towerdef.nodes.MonsterCollisionNode;
	import com.poddcorp.towerdef.nodes.TileRenderNode;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GunControlSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.GunControlNode")]
		public var nodes:NodeList;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MonsterCollisionNode")]
		public var monsters:NodeList;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.BulletCollisionNode")]
		public var bullets:NodeList;
		
		override public function update(time:Number):void
		{
			var monster:MonsterCollisionNode;
			var bullet:BulletCollisionNode;
			var node:GunControlNode;
			
			var position:Position;
			var gun:Gun;
			
			//Each Gun
			for (node = nodes.head; node; node = node.next)
			{
				gun = node.gun;
				position = node.position;
				
				//Each Monster
				for (monster = monsters.head; monster; monster = monster.next)
				{
					gun.shooting = checkRange(node.position, monster.position);
					gun.timeSinceLast += time;
					
					if (gun.shooting && gun.timeSinceLast >= gun.shotInterval)
					{
						creator.createBullet(gun, position);
						position.direction = "N";
						gun.timeSinceLast = 0;
					}
				}
				
			}
		}
		
		private function checkRange(tower:Position, monster:Position):Boolean
		{
			if (Point.distance(tower.position, monster.position) < 150)
			{
				return true;
			}
			return false;
		}
	
	}

}