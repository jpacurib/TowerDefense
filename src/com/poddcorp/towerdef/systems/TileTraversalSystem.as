package com.poddcorp.towerdef.systems 
{
	import ash.tools.ListIteratingSystem;
	import com.poddcorp.towerdef.nodes.TileTraversalNode;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileTraversalSystem extends ListIteratingSystem 
	{
		
		public function TileTraversalSystem() 
		{
			super(TileTraversalNode, updateNode);
		}
		
		private function updateNode(node:TileTraversalNode, time:Number):void 
		{
			trace(node);
		}
	}

}