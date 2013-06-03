package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tower;
	/**
	 * TowerNode holds data of each tower created by entity creator
	 * 
	 */
	public class TowerNode extends Node
	{
		//Declares tower variable as Tower Component
		public var tower:Tower;
		
		//Declares position variable as Position Component
		public var position:Position;
	}

}