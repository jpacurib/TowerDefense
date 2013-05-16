package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.MonsterMotion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.MonsterMovementNode;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterMovementSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.MonsterMovementNode")]
		public var movementNode:NodeList;
		
		override public function update(time:Number):void
		{
			var node:MonsterMovementNode;
			var position:Position;
			var motion:MonsterMotion;
			
			for (node = movementNode.head; node; node = node.next)
			{
				position = node.position;
				motion = node.motion;
				
				position.position.x += motion.velocity.y * time + .5;//motion.velocity.x * time + .5;
				position.position.y += 0;
				
				if (position.position.x > 928 + 16 && position.position.y == 416)
				{
					creator.destroyEntity(node.entity);
				}
			}
		
		}
		
	}

}