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
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.MonsterMovementNode")]
		public var monsterNode:NodeList;
		
		private var mapDrawn:Boolean = false;
		private var monsterStartingPoint:Array = new Array();
		private var monsterEndingPoint:Array = new Array();
		private var incurredTime:Number = 0;
		
		override public function update(time : Number) : void 
		{
			var node:GameNode;
			var monsterNode:MonsterMovementNode;
			incurredTime += time;
			
			//Create Isometric Tiles
			if (!mapDrawn)
			{
				for (var col:int = 0; col < 15; col++)
				{
					for (var row:int = 0; row < 15; row++)
					{
						var colX:Number = ((1024 / 2) - 32) + (row - col) * 64 / 2;
						var colY:Number = (768 / 4) + (col + row) * 32 / 2;
						
							if (Math.random() < .8) creator.createTile(colX , colY);
							else creator.createWall(colX+2, colY-30);
						
						//end point of monsters
						if (col == 0)
						{
							monsterEndingPoint[row] = new Point(colX, colY);
						}
						
						//starting point of monsters
						if (col == 14)
						{
							monsterStartingPoint[row] = new Point(colX, colY);
						}
					}
				}
				mapDrawn = true;
			}
			
			//Constant Check
			for (node = gameNodes.head; node; node = node.next) 
			{
				
				// Continue while life != 0
				if (node.state.lives > 0)
				{
					//GENERATING monster every 2 seconds
					if (node.state.monperwave > 0)
					{
						var randomNumber:int = Math.random() * 14;
						
						
						if (incurredTime > 2) 
						{
							creator.createMonster(monsterStartingPoint[randomNumber].x + 16, monsterStartingPoint[randomNumber].y, 0);
							incurredTime = 0;
							node.state.monperwave--;
							trace(node.state.monperwave);
							
							//movement should be x++ y--
						}
						
					}
				}
				else
				{
					//Life == 0
				}
			}
			
			//Movement of Monster
		}
	}
}
