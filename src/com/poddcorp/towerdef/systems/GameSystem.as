package com.poddcorp.towerdef.systems {
	import com.poddcorp.towerdef.nodes.GameNode;
	import ash.core.NodeList;
	import ash.core.System;

	/**
	 * @author christiannoelmascarinas
	 */
	public class GameSystem extends System 
	{
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.GameNode")]
		public var gameNodes:NodeList;
			
		override public function update(time : Number) : void 
		{
			var node:GameNode;
			for (node = gameNodes.head; node; node = node.next) 
			{
				
			}
		}
	}
}
