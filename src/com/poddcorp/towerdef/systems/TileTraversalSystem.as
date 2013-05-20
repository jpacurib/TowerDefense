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
		
		[Inject]
		public var _map:IsoMap;
		
		[Inject]
		public var _inode:INode;
		
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		[Inject(name="end")]
		public var endTile:IsoTile;
		
		//[Inject(nodeType="com.poddcorp.towerdef.nodes.TileNode")]
		//public var tileNodes:NodeList;
		
		public var startPosition:Point;
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
			
			var monsterNode:MovementNode;
			var tileNode:TileNode;
			//get path
			//var pathArray:Array = Pathfinder.findPath(_map.startTile, _map.endTile, _map.findConnectedNodes);
			
			//_map.drawPath(Pathfinder.findPath(_map.startTile, _map.endTile, _map.findConnectedNodes));
			
			/*
			   node.tile.currentTile
			   node.tile.pathNodes
			   //node.position
			   node.motion
			   startTile
			   endTile
			
			 */
			
			//trace(node.tile.currentTile, node.tile.pathNodes[0]);
		
		}
	
	}

}