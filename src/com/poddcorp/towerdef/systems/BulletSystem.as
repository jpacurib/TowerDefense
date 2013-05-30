package com.poddcorp.towerdef.systems
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Gun;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.nodes.BulletCollisionNode;
	import com.poddcorp.towerdef.nodes.GunControlNode;
	import com.poddcorp.towerdef.nodes.MonsterCollisionNode;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletSystem extends System
	{
		[Inject(nodeType="com.poddcorp.towerdef.nodes.BulletCollisionNode")]
		public var bullets:NodeList;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MonsterCollisionNode")]
		public var monsters:NodeList;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.GunControlNode")]
		public var guns:NodeList;
		
		override public function update(time:Number):void
		{
			var bullet:BulletCollisionNode;
			var monster:MonsterCollisionNode;
			var gun:GunControlNode;
			
			var tempX:Number, tempY:Number;
			
			for (gun = guns.head; gun; gun = gun.next)
			{
				for (monster = monsters.head; monster; monster = monster.next)
				{
					gun.gun.shooting = checkRange(gun.position, monster.position);
					
					for (bullet = bullets.head; bullet; bullet = bullet.next)
					{
						tempX = (monster.position.position.x - gun.position.position.x);
						tempY = (monster.position.position.y - gun.position.position.y);
						
						if (tempY > 0) bullet.motion.velocity.y = 300;
						else if (tempY == 0) tempY = 0;
						else bullet.motion.velocity.y = -300
						
						if (tempX > 0) bullet.motion.velocity.x = 300;
						else if (tempX == 0) tempX = 0;
						else bullet.motion.velocity.x = -300
						
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
			if (Point.distance(tower.position, monster.position) < 200)
			{
				return true;
			}
			return false;
		}
	
	}

}