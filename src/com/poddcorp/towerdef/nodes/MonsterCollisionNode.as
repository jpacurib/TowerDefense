package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;

	import com.poddcorp.towerdef.components.Collision;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterCollisionNode extends Node
	{
		public var monster:Monster;
		public var position:Position;
		public var collision:Collision;
		
	}

}