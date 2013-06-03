package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	
	/**
	 * TileTraversalNode contains data of each Entity created with Tile, Position, and Motion Component. 
	 * Specifically created for determining the path of the monster from the tiles.
	 */
	public class TileTraversalNode extends Node 
	{
		//Declares tile variable as Tile Component
		public var tile:Tile;
		
		//Declares position variable as Position Component
		public var position:Position;
		
		//Declares motion variable as Motion Component
		public var motion:Motion;
	}

}