package com.poddcorp.towerdef.nodes
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.TileDisplay;
	
	/**
	 * TileRenderNode contains the position component and display component for each rendered entity.
	 * Specifically for tile and monster display component
	 */
	public class TileRenderNode extends Node
	{
		//Declares position variable as Position component
		public var position:Position;
		
		//Declares display variable as Display component
		public var display:TileDisplay;
	}

}