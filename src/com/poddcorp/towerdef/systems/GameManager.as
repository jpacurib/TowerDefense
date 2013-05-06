package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.GameConfig;
	import com.poddcorp.towerdef.nodes.GameNode;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameManager extends System
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
			
			trace(gameNodes);
		}
	}

}