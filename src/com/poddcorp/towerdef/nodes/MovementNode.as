package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import ash.core.NodeList;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * Movement Node contains position and motion of each entity created with Position and Motion Component
	 * 
	 */
	public class MovementNode extends Node
	{
		//Declares position variable as Position component
		public var position:Position;
		
		//Declares motion variable as Motion component
		public var motion:Motion;
	}

}