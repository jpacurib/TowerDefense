package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileTraversalNode extends Node 
	{
		public var tile:Tile;
		public var position:Position;
		public var motion:Motion;
	}

}