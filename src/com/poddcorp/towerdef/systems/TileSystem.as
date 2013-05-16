package com.poddcorp.towerdef.systems
{
	import ash.core.Entity;
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.graphics.TileView;
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.nodes.TileNode;
	import starling.display.Sprite;
	
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
			var rowX:Number;
			var rowY:Number;
						
			if (!isMapDrawn)
			{
				for (var row:int = 0; row < 15; row++)
				{
					for (var col:int = 0; col < 15; col++)
					{
						rowX = ((1024 / 2) - 32) + (col - row) * 64 / 2;
						rowY = (768 / 4) + (col + row) * 32 / 2;

						if(Math.random() < .92)
							creator.createTile(rowX, rowY);	
						else creator.createWall(rowX, rowY);	
							
						//if (row == 0 && col == 14) trace(rowX + ' ' + rowY);
					}
				}
				
				isMapDrawn = true;
			}
		
		}
	
	}

}