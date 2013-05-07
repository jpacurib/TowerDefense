package com.poddcorp.towerdef.systems {
	
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.GameNode;
	import starling.display.Sprite;
	//import com.poddcorp.towerdef.nodes.MonsterCollisionNode;
	import ash.core.NodeList;
	import ash.core.System;

	/**
	 * @author christiannoelmascarinas
	 */
	public class GameSystem extends System 
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.GameNode")]
		public var gameNodes:NodeList;
		
		override public function update(time : Number) : void 
		{
			var node:GameNode;
			
			//Create Tiles
			for (var col:int = 0; col <= 10; col++)
			{
				for (var row:int = 0; row <= 10; row++)
				{
					creator.createTile(row*51, col*51);
				}
			}
			
			//Constant Check
			for (node = gameNodes.head; node; node = node.next) 
			{
				
				// Continue while life != 0
				if (node.state.lives > 0)
				{
					
					
				}
				else
				{
					//Life == 0
				}
				
				//
				
				
			}
		}
	}
}
