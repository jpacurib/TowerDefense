package com.poddcorp.towerdef.systems
{
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.graphics.TileView;
	import com.poddcorp.towerdef.nodes.TileNode;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileSystem extends System
	{
		[Inject]
		public var creator:EntityCreator;
		
		private var isMapDrawn:Boolean = false;
		
		override public function update(time:Number):void
		{

			var colX:Number;
			var colY:Number;
			if (!isMapDrawn)
			{
				for (var col:int = 0; col < 15; col++)
				{
					for (var row:int = 0; row < 15; row++)
					{
						colX = ((1024 / 2) - 32) + (row - col) * 64 / 2;
						colY = (768 / 4) + (col + row) * 32 / 2;
							creator.createTile(colX, colY);				
					}
				}
				isMapDrawn = true;
			}
		
		}
	
	}

}