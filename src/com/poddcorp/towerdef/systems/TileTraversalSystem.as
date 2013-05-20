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
		public var _map:IsoMap;
		
		[Inject]
		public var _inode:INode;
		
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		[Inject(name="end")]
		public var endTile:IsoTile;
		
		private var arrayCounter:Number = 0;
		
		public function TileTraversalSystem()
		{
			super(TileTraversalNode, updateNode);
		}
		
		private function updateNode(node:TileTraversalNode, time:Number):void
		{
			var motion:Motion = node.motion;
			
			/*
			   node.tile.currentTile
			   node.tile.pathNodes
			   //node.position
			   node.motion
			   startTile
			   endTile
			
			 */
			
			/*if (node.tile.currentTile == node.next)
			   {
			   trace(node.tile.currentTile + " is equal to " + node.tile.pathNodes[node.tile.pathNodes.length - node.tile.pathNodes.length]);
			 }*/
			
			if (node.tile.currentTile == endTile)
			{
				trace("Human na");
				motion.velocity.x = 0;
				motion.velocity.y = 0;
				
			}
			
			if (node.tile.currentTile != node.tile.pathNodes[arrayCounter])
			{
				motion.velocity.x = node.tile.currentTile.x - node.tile.pathNodes[arrayCounter].x;
				motion.velocity.y = node.tile.pathNodes[arrayCounter].y - node.tile.currentTile.y;
			}
			if (node.tile.currentTile == node.tile.pathNodes[arrayCounter])
			{
				arrayCounter++;
				trace(arrayCounter)
			}
		
		/*if (node.tile.currentTile != node.tile.pathNodes[node.tile.pathNodes.length - 1])
		   {
		   if (node.tile.currentTile != node.tile.pathNodes[counter])
		   {
		   motion.velocity.x = node.tile.currentTile.x - node.tile.pathNodes[counter].x;
		   motion.velocity.y = node.tile.pathNodes[counter].y - node.tile.currentTile.y;
		   }
		
		   if (node.tile.currentTile.x == node.tile.pathNodes[counter].x && node.tile.currentTile.y == node.tile.pathNodes[counter].y)
		   {
		   node.tile.currentTile = node.tile.pathNodes[counter];
		   trace(counter);
		   counter++;
		   }
		   }
		   else
		   {
		   //HUMAN
		 }*/
		
		}
	
	}

}