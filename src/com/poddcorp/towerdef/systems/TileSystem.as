package com.poddcorp.towerdef.systems 
{
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		private var isMapDrawn:Boolean = false;
		
		public function TileSystem() 
		{
			for (var col:int = 0; col < 15; col++)
				{
					for (var row:int = 0; row < 15; row++)
					{
						var colX:Number = ((1024 / 2) - 32) + (row - col) * 64 / 2;
						var colY:Number = (768 / 4) + (col + row) * 32 / 2;
						
						if (Math.random() < .8) creator.createTile(colX , colY);
						else creator.createWall(colX+2, colY-30);
					}
				}
			isMapDrawn = true;
		}
		
	}

}