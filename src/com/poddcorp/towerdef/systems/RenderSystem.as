package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.nodes.RenderNode;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class RenderSystem extends System
	{
		[Inject]
		public var container:DisplayObjectContainer;
		
		[Inject(nodeType = "com.poddcorp.towerdef.nodes.RenderNode")]
		public var nodes:NodeList;
		
		[PostConstruct]
		public function setUpListeners():void
		{
			for (var node:RenderNode = nodes.head; node; node = node.next)
			{
				addToDisplay(node);
			}
			nodes.nodeAdded.add(addToDisplay);
			nodes.nodeRemoved.add(removeFromDisplay);
		}
		
		private function removeFromDisplay(node:RenderNode):void 
		{
			container.removeChild(node.display.displayObject);
		}
		
		private function addToDisplay(node:RenderNode):void 
		{
			container.addChild(node.display.displayObject);
		}
		
		override public function update(time:Number):void
		{
			var node:RenderNode;
			var position:Position;
			var display:Display;
			var displayObject:DisplayObject;
			
			for (node = nodes.head; node; node = node.next)
			{
				display = node.display;
				displayObject = display.displayObject;
				position = node.position;
				
				displayObject.x = position.position.x;
				displayObject.y = position.position.y;
				displayObject.rotation = position.rotation * 180 / Math.PI;
			}
		}
		
	}

}