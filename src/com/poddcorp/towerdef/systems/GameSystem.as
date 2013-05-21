package com.poddcorp.towerdef.systems {
	
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.IsoMap;
	import com.poddcorp.towerdef.IsoTile;
	import com.poddcorp.towerdef.nodes.GameNode;
	import com.poddcorp.towerdef.nodes.MovementNode;
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
		
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		[Inject(name="end")]
		public var endTile:IsoTile;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.GameNode")]
		public var gameNodes:NodeList;
					
		private var isMapDrawn:Boolean = false;
		
		public function GameSystem():void 
		{
			super();
		}
		
		
		override public function update(time : Number) : void 
		{
			var node:GameNode;
								
			//Constant Check
			for (node = gameNodes.head; node; node = node.next) 
			{
					if (node.state.monperwave > 0)
					{
						trace(startTile.x, startTile.y);
						creator.createMonster(startTile);
						node.state.monperwave--;
					}
					
					
			}
			
			//Movement of Monster
		}
	}
}
