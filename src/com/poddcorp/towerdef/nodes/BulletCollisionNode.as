package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Motion;

	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.components.Collision;
	import com.poddcorp.towerdef.components.Position;
/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletCollisionNode extends Node
	{
		public var bullet:Bullet;
		public var collision:Collision;
		public var position:Position;
		public var motion:Motion;
	}

}