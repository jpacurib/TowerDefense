package com.poddcorp.towerdef.systems
{
	import ash.core.NodeList;
	import ash.tools.ListIteratingSystem;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.MovementNode;
	import com.poddcorp.towerdef.nodes.TileNode;
	import com.poddcorp.towerdef.nodes.TileTraversalNode;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileTraversalSystem extends ListIteratingSystem
	{
		[Inject]
		public var _creator:EntityCreator;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MovementNode")]
		public var monsterNodes:NodeList;
		
		public function TileTraversalSystem()
		{
			super(TileTraversalNode, updateNode);
		}
		
		private function updateNode(node:TileTraversalNode, time:Number):void
		{
			var monsterNode:MovementNode;
			
			for (monsterNode = monsterNodes.head; monsterNode; monsterNode = monsterNode.next)
			{
				monsterNode.position.position.x += 1;
				monsterNode.position.position.y += 1;
				
				trace(node.tile);
			}
		}
	}

}