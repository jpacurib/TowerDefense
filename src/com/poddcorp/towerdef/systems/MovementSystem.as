package com.poddcorp.towerdef.systems
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.MovementNode;
	import com.poddcorp.towerdef.nodes.TileNode;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MovementSystem extends System
	{
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MovementNode")]
		public var movementNodes:NodeList;
		
		override public function update(time:Number):void
		{
			var node:MovementNode;
			var position:Position;
			var motion:Motion;
			for (node = movementNodes.head; node; node = node.next)
			{
				position = node.position;
				motion = node.motion;
				
				position.position.x += motion.velocity.x * time;
				position.position.y += motion.velocity.y * time;
				
			}
		}
	
	}

}