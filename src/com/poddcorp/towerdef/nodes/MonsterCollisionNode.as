package com.poddcorp.towerdef.nodes 
{
	import ash.core.Node;

	import com.poddcorp.towerdef.components.Collision;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Position;
	/**
	 * Monster Collision Node holds every monster with it's position and collision radius
	 * 
	 */
	public class MonsterCollisionNode extends Node
	{
		//Declares monster variable as Monster Component
		public var monster:Monster;
		
		//Declares position variable as Position Component
		public var position:Position;
		
		//Declares collision variable as Collision Component
		public var collision:Collision;
	}

}