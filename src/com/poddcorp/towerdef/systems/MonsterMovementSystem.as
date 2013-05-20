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
	public class MonsterMovementSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.MonsterMovementNode")]
		public var movementNodes:NodeList;
		
		override public function update(time:Number):void
		{
			var movementNode:MovementNode;
			var position:Position = movementNode.position;
			var motion:Motion = movementNode.motion;
			//var tileNode:TileNode;
			
			var motion:Motion;
			
			for (movementNode = movementNode.head; movementNode; movementNode = node.next)
			{
				
			}
		
		}
		
	}

}