package com.poddcorp.towerdef.systems {
	
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.nodes.GameNode;
	import com.poddcorp.towerdef.nodes.MonsterMovementNode;
	import flash.geom.Point;
	import starling.display.Sprite;
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
			
		private var isMapDrawn:Boolean = false;
		private var delay:Number = new Number;
		
		override public function update(time : Number) : void 
		{
			var node:GameNode;
			
			delay += time;
									
			//Constant Check
			for (node = gameNodes.head; node; node = node.next) 
			{
					if (node.state.monperwave > 0)
					{
							if (delay > 8) 
							{
							creator.createMonster(32 + 16, 416, 0);
							node.state.monperwave--;
							delay = 0;
							}
									
					}
			}
			
			//Movement of Monster
		}
	}
}
