package com.poddcorp.towerdef.nodes
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Motion;
	
	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.components.Collision;
	import com.poddcorp.towerdef.components.Position;
	
	/**
	 * Bullet Collision for every object with bullet as object
	 *
	 */
	public class BulletCollisionNode extends Node
	{
		//Declares new bullet with Bullet data type or class
		public var bullet:Bullet;
		
		//Declares new collision with Collision data type or class
		public var collision:Collision;
		
		//Declares new position with Position data type or class
		public var position:Position;
		
		//Declares new motion with Motion data type or class
		public var motion:Motion;
	}

}