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
	import com.poddcorp.towerdef.nodes.GameNode;
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
		
		public function TileTraversalSystem()
		{
			super(TileTraversalNode, updateNode);
		}
		
		private function updateNode(node:TileTraversalNode, time:Number):void
		{
			var motion:Motion = node.motion;
			var position:Position = node.position;
			
			/////////////////////
			for (var i:int = 0; i < node.tile.pathNodes.length; i++)
			{
				var nextTile:IsoTile;
				
				if (node.tile.currentTile == node.tile.pathNodes[i])
				{
					nextTile = node.tile.pathNodes[i + 1];
					
					if (nextTile == null)
					{
						nextTile = endTile;
					}
					
					if (nextTile.traversable == false)
					{
						if (Pathfinder.findPath(node.tile.currentTile, endTile, _map.findConnectedNodes) == null)
						{
							nextTile = node.tile.currentTile;
						}
						else
						{
							node.tile.pathNodes = Pathfinder.findPath(node.tile.currentTile, endTile, _map.findConnectedNodes);
							nextTile = node.tile.pathNodes[1];
						}
					}
					
					break;
				}
			}
			
			//movement
			if (node.tile.currentTile == endTile && nextTile == null)
			{
				motion.velocity.x = 0;
				motion.velocity.y = 0;
				
			}
			else
			{
				motion.velocity.x = nextTile.x - node.tile.currentTile.x;
				motion.velocity.y = nextTile.y - node.tile.currentTile.y;
				
				//DIRECTION
				if (motion.velocity.x == 0)
				{
					if (motion.velocity.y > 0)
					{
						position.direction = "S";
					}
					else
						position.direction = "N";
				}
				
				if (motion.velocity.y == 0)
				{
					if (motion.velocity.x > 0)
					{
						position.direction = "E";
					}
					else
						position.direction = "W";
				}
				
				if (motion.velocity.x > 0 && motion.velocity.y > 0)
				{
					position.direction = "SE";
				}
				
				if (motion.velocity.x > 0 && motion.velocity.y < 0)
				{
					position.direction = "NE";
				}
				
				if (motion.velocity.x < 0 && motion.velocity.y > 0)
				{
					position.direction = "SW";
				}
				
				if (motion.velocity.x < 0 && motion.velocity.y < 0)
				{
					position.direction = "NW";
				}
				
			}
			if (Point.distance(new Point(position.position.x + 72, position.position.y + 72), new Point(nextTile.x, nextTile.y)) < (nextTile.height / 8))
			{
				node.tile.currentTile = nextTile;
			}
		}
	
	}

}