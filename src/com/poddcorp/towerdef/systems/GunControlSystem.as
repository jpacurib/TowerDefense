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
					
					for (bullet = bullets.head; bullet; bullet = bullet.next)
					{
						var tempX:Number, tempY:Number;
						
						tempX = (monster.position.position.x - node.position.position.x);
						tempY = (monster.position.position.y - node.position.position.y);
						
						if (tempY > 0)
							bullet.motion.velocity.y = 300;
						else if (tempY == 0)
							tempY = 0;
						else
							bullet.motion.velocity.y = -300
						
						if (tempX > 0)
							bullet.motion.velocity.x = 300;
						else if (tempX == 0)
							tempX = 0;
						else
							bullet.motion.velocity.x = -300
						
						//DIRECTION
						if (bullet.motion.velocity.x == 0)
						{
							if (bullet.motion.velocity.y > 0)
							{
								bullet.position.direction = "S";
							}
							else
								bullet.position.direction = "N";
						}
						
						if (bullet.motion.velocity.y == 0)
						{
							if (bullet.motion.velocity.x > 0)
							{
								bullet.position.direction = "E";
							}
							else
								bullet.position.direction = "W";
						}
						
						if (bullet.motion.velocity.x > 0 && bullet.motion.velocity.y > 0)
						{
							bullet.position.direction = "SE";
						}
						
						if (bullet.motion.velocity.x > 0 && bullet.motion.velocity.y < 0)
						{
							bullet.position.direction = "NE";
						}
						
						if (bullet.motion.velocity.x < 0 && bullet.motion.velocity.y > 0)
						{
							bullet.position.direction = "SW";
						}
						
						if (bullet.motion.velocity.x < 0 && bullet.motion.velocity.y < 0)
						{
							bullet.position.direction = "NW";
						}
						
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