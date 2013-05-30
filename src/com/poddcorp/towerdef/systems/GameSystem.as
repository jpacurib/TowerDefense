package com.poddcorp.towerdef.systems
{
	
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.IsoMap;
	import com.poddcorp.towerdef.IsoTile;
	import com.poddcorp.towerdef.nodes.GameNode;
	import com.poddcorp.towerdef.nodes.MovementNode;
	import com.poddcorp.towerdef.nodes.TileTraversalNode;
	import flash.geom.Point;
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
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.TileTraversalNode")]
		public var monsterNodes:NodeList;
		
		public function GameSystem():void
		{
			super();
		}
		
		override public function update(time:Number):void
		{
			var node:GameNode;
			var monsterNode:TileTraversalNode;
			var destinationReached:Boolean = false;
			
			//Constant Check
			for (node = gameNodes.head; node; node = node.next)
			{
				if (node.state.lives > 0)
				{
					if (node.state.monperwave > 0)
					{
						creator.createVoodooMonster(startTile);
						node.state.monperwave--;
					}
					
					for (monsterNode = monsterNodes.head; monsterNode; monsterNode = monsterNode.next)
					{
						if ((Point.distance(new Point(monsterNode.position.position.x + 72, monsterNode.position.position.y + 72), new Point(endTile.x, endTile.y)) < (endTile.height / 2)))
						{
							node.state.lives--;
							creator.destroyEntity(monsterNode.entity);
							
							if (Math.random() >= 0 && Math.random() <= .3)
							{
								creator.createSkullMonster(startTile);
							}
							
							else if (Math.random() > .3 && Math.random() <= .5)
							{
								creator.createOrcMonster(startTile);
							}
							
							else
							{
								creator.createVoodooMonster(startTile);
							}
							
						}
						
					}
				}
				else
				{
					trace("game over");
				}
			}
		
		}
	}
}
