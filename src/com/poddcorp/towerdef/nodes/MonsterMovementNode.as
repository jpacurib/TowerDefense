package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import ash.core.NodeList;
	import com.poddcorp.towerdef.components.MonsterMotion;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterMovementNode extends Node
	{
		/*[Inject(nodetype="com.poddcorp.towerdef.nodes.MonsterMovementNode")]
		public var monster:NodeList;*/
		
		public var position:Position;
		public var motion:MonsterMotion;
		
	}

}