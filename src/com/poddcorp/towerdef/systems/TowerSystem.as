package com.poddcorp.towerdef.systems 
{
	import ash.core.Node;
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.nodes.TileNode;
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
			var tile:Tile;
			
			for (node = tileNodes.head; node; node = node.next)
			{
				tile.pressed = _touchPoll.isPressed(
			}
		}
		
	}

}