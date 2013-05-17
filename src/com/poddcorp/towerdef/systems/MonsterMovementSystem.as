package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.MonsterMotion;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.MonsterMovementNode;
	import com.poddcorp.towerdef.nodes.TileNode;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterMovementSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		/*[Inject(nodeType = "com.poddcorp.towerdef.nodes.MonsterMovementNode")]
		public var movementNode:NodeList;*/
		
		/*[Inject(nodeType = "com.poddcorp.towerdef.nodes.TileNodes")]
		public var tileNodes:NodeList;*/
		
		override public function update(time:Number):void
		{
			var node:MonsterMovementNode;
			var tileNode:TileNode;
			
			var motion:Motion;
			
			for (node = movementNode.head; node; node = node.next)
			{
				position = node.position;
				motion = node.motion;
				
				if (position.position.x > 928 + 16 && position.position.y == 416)
				{
					creator.destroyEntity(node.entity);
				}
			}
		
		}
		
	}

}