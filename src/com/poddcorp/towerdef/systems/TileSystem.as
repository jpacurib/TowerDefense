package com.poddcorp.towerdef.systems
{
	import ash.core.Engine;
	import ash.core.Entity;
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
		private var entityMapHolder:Entity = new Entity();
				
		private var rowX:Number;
		private var rowY:Number;
		
						
		override public function update(time:Number):void
		{
				
			createNodes();
		
		}
		
		private function createNodes():void 
		{
			if (!isMapDrawn)
			{
				for (var row:int = 0; row < 15; row++)
				{
					for (var col:int = 0; col < 15; col++)
					{
						rowX = ((1024 / 2) - 32) + (col - row) * 64 / 2;
						rowY = (768 / 4) + (col + row) * 32 / 2;
						
						entityMapHolder = (creator.createTile(rowX, rowY));
						//_nodes.push(emtityHolder);	
						
						//engine.addEntity(entityHolder);
					}
				}
				
			isMapDrawn = true;
			}
		}
	
	}

}