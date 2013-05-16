package com.poddcorp.towerdef.systems 
{
	import ash.core.Entity;
	import ash.core.Node;
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.nodes.TileNode;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerSystem extends System
	{
		[Inject]
		public var _touchPoll:TouchPoll;
		
		[Inject]
		public var _creator:EntityCreator;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.TileNode")]
		public var tileNodes:NodeList;
		
		override public function update(time:Number):void
		{
			var node:TileNode;
			var position:Position;
			
			var newPos:Point = new Point();
			
			for (node = tileNodes.head; node; node = node.next)
			{
				node.tile.pressed = _touchPoll.isPressed;
												
				if (node.tile.pressed == true)
				{
					//newPos = new Point(position.position.x, position.position.y);
					//_creator.createTower(newPos.x, newPos.y);
					//_creator.destroyEntity(node.entity);
				}
			}
		}
		
	}

}