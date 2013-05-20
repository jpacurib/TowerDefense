package com.poddcorp.towerdef.systems
{
	import ash.core.Node;
	import ash.core.NodeList;
	import ash.tools.ListIteratingSystem;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.IsoMap;
	import com.poddcorp.towerdef.IsoTile;
	import com.poddcorp.towerdef.nodes.MovementNode;
	import com.poddcorp.towerdef.nodes.TileNode;
	import com.poddcorp.towerdef.nodes.TileTraversalNode;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import flash.geom.Point;
	import flash.security.IURIDereferencer;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileTraversalSystem extends ListIteratingSystem
	{
		[Inject]
		public var _entityCreator:EntityCreator;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.MovementNode")]
		public var monsterNodes:NodeList;
		
		[Inject]
		public var _map:IsoMap;
		
		[Inject]
		public var _inode:INode;
		
		//public var startPosition:INode = _map._startTile as IsoTile; 
		public var targetPosition:Point;
		public var init:Boolean;
		
		public function TileTraversalSystem()
		{
			super(TileTraversalNode, updateNode);
		}
		
		private function updateNode(node:TileTraversalNode, time:Number):void
		{			
			var tilePosition:Position = node.position;
			var tileMotion:Motion = node.motion;
			
			
			//startPosition = new Point(_map.getTile(10, 0).x, _map.getTile(10, 0).y);
			//targetPosition = new Point(Math.abs(_map.getTile(10, 10).x), _map.getTile(10, 10).y);
			
			var monsterNode:MovementNode;
			
			//trace(_map.getTile(10,10).x, _map.getTile(10, 10).y);
			trace(_map.getTile(0, 0));
			
			//trace(targetPosition);
			
			//var pathArray:Array = Pathfinder.findPath(_map.startTile, _map.endTile, _map.findConnectedNodes);
			//Pathfinder.heuristic = Pathfinder.euclidianHeuristic;
			_map.drawPath(Pathfinder.findPath(_map.startTile, _map.endTile, _map.findConnectedNodes));
			
			for (monsterNode = monsterNodes.head; monsterNode; monsterNode = monsterNode.next)
			{
				var monsterPosition:Position = monsterNode.position;
				var monsterMotion:Motion = monsterNode.motion;
				
				/*if (!init)
				{
				monsterPosition.position.x = Math.abs(_map.getTile(10, 0).x);
				monsterPosition.position.y = _map.getTile(10, 0).y;
				init = true;
				}*/
				
				
				//POSITION??
				/*monsterPosition.position.x = (pathArray[0].y - pathArray[0].x) * 45 / 2;
				monsterPosition.position.y = (pathArray[0].x + pathArray[0].y) * 45 / 2;*/
				
				//patharray position TO path array next index
								
				//For determining the position of the target
				/*if (monsterPosition.position.x < targetPosition.x)
				{
					monsterPosition.position.x += monsterMotion.velocity.x * time + 1;
				}
				else if (monsterPosition.position.x > targetPosition.x)
					monsterPosition.position.x -= monsterMotion.velocity.x * time + 1;
					
				else monsterPosition.position.x += 0;
				
				if (monsterPosition.position.y < targetPosition.y)
				{
					monsterPosition.position.y += monsterMotion.velocity.y * time + 1;
				}
				else if (monsterPosition.position.y > targetPosition.y)
					monsterPosition.position.y -= monsterMotion.velocity.y * time + 1;
					
				else monsterPosition.position.y += 0;
				
				//Destroy monster if target is reached
				if (monsterPosition.position.x == targetPosition.x && monsterPosition.position.y == targetPosition.y)
				{
					_entityCreator.destroyEntity(monsterNode.entity);
				}*/
			}
			
		}
		
	}

}