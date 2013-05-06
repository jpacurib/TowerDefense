package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.nodes.AnimationNode;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class AnimationSystem extends System
	{
		[Inject(nodeType="Nodes.AnimationNode")]
		public var nodes:NodeList;
		
		override public function update(time:Number):void 
		{
			var node:AnimationNode;
			for (node = nodes.head; node; node = node.next)
			{
				node.animation.animation.animate(time);
			}
		}
		
	}

}