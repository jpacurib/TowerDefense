package com.poddcorp.towerdef.components 
{
	import com.poddcorp.towerdef.IsoTile;
	/**
	 * Tile Class which stores the current tile position and path for monster.
	 *
	 */
	public class Tile
	{
		//Declares current tile position with IsoTile data type.
		public var currentTile:IsoTile;
		
		//Declares an array for storage of path from pathfinding algorithm
		public var pathNodes:Array;
		
		/**
		 * Sets current tile position and the set of nodes for monster to travel.
		 * @param	currentTile	Current position or tile.
		 * @param	pathNodes	Array that stores the result of pathfinding algorithm for path of monster. 
		 */
		public function Tile(currentTile:IsoTile, pathNodes:Array) {
			
			//Sets currentTile value to the value currentTile parameter.
			this.currentTile = currentTile;
			
			//Sets list of nodes for path to the value of pathNodes parameter.
			this.pathNodes = pathNodes;
		}
	}

}