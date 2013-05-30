package com.poddcorp.towerdef.components 
{
	import com.poddcorp.towerdef.graphics.ITileView;
	/**
	 * TileDisplay Class is a specific class for tile based objects
	 * 
	 */
	public class TileDisplay 
	{
		//Declares displayObject that is an Interface class for tiles
		public var displayObject:ITileView;
		
		/**
		 * Sets displayObject of tile based entities
		 * @param	displayObject	DisplayObject to be passed as ITileView
		 */
		public function TileDisplay(displayObject:ITileView) 
		{
			//Sets local display object value to value of parameter.
			this.displayObject = displayObject;
		}
		
	}

}