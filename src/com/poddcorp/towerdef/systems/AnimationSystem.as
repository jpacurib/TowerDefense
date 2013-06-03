package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.nodes.AnimationNode;
	/**
	 * Animation System for each Animation Node
	 * 
	 */
	public class AnimationSystem extends System
	{
		//Gets instance of Animation node and puts it to nodes variable
		[Inject(nodeType="com.poddcorp.towerdef.nodes.AnimationNode")]
		public var nodes:NodeList;
		
		override public function update(time:Number):void 
		{
			//Declares node as AnimationNode
			var node:AnimationNode;
			
			for (node = nodes.head; node; node = node.next)
			{
				//Sets animation of node using time
				node.animation.animation.animate(time);
			}
		}
		
	}

}