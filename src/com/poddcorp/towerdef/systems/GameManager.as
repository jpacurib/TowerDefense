package com.poddcorp.towerdef.systems 
{
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameManager 
	{
		[Inject]
		public var config:GameConfig;
		
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType = "Nodes.GameNode")];
		public var gameNodes:NodeList;
		
		override public function update(time:Number):void
		{
			var node:GameNode;
			
			
		}
	}

}