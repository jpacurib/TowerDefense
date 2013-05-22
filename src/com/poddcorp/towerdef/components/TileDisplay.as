package com.poddcorp.towerdef.components 
{
	import com.poddcorp.towerdef.graphics.ITileView;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileDisplay 
	{
		public var displayObject:ITileView;
		
		public function TileDisplay(displayObject:ITileView) 
		{
			this.displayObject = displayObject;
		}
		
	}

}