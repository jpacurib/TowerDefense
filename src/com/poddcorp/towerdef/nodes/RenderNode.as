package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * RenderNode contains the position component and display component for each rendered entity
	 * 
	 */
	public class RenderNode extends Node
	{
		//Declares position variable as Position Component
		public var position:Position;
		
		//Declares display variable as Display Component
		public var display:Display;

	}

}