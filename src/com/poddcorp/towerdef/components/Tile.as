package com.poddcorp.towerdef.components 
{
	import com.poddcorp.towerdef.IsoTile;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Tile
	{
		public var currentTile:IsoTile;
		public var pathNodes:Array;
		
		public function Tile(currentTile:IsoTile, pathNodes:Array) {
			this.currentTile = currentTile;
			this.pathNodes = pathNodes;
		}
	}

}