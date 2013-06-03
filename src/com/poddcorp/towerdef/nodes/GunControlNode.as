package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Gun;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * Gun Control Node
	 * 
	 */
	public class GunControlNode extends Node
	{
		//Declares position as a holder of the position of Gun and direction as "" or empty
		public var position:Position;
		
		//Declares gun that has properties of shooting interval, bullet age, and the position from tower
		public var gun:Gun;
	}
}