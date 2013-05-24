package com.poddcorp.towerdef.systems 
{
	import ash.core.NodeList;
	import ash.core.System;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.TileDisplay;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.graphics.ITileView;
	import com.poddcorp.towerdef.graphics.MonsterView;
	import com.poddcorp.towerdef.IsoTile;
	import com.poddcorp.towerdef.nodes.RenderNode;
	import com.poddcorp.towerdef.nodes.TileRenderNode;
	import starling.display.DisplayObject;
	
	import starling.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileRenderSystem extends System
	{
		[Inject]
		public var container:DisplayObjectContainer
		
		[Inject(name = "end")]
		public var endTile:IsoTile;
		
		[Inject(name = "start")]
		public var startTile:IsoTile;
		
		[Inject]
		public var creator:EntityCreator;
		
		[Inject(nodeType="com.poddcorp.towerdef.nodes.TileRenderNode")]
		public var nodes:NodeList;
		
		[PostConstruct]
		public function setUpListeners():void
		{
			var node:TileRenderNode;
			
			for (node = nodes.head; node; node.next)
			{
				addToDisplay(node);
			}
			nodes.nodeAdded.add(addToDisplay);
			nodes.nodeRemoved.add(removeFromDisplay);
		}
		
		private function removeFromDisplay(node:TileRenderNode):void 
		{
			container.removeChild(node.display.displayObject as DisplayObject);
		}
		
		private function addToDisplay(node:TileRenderNode):void 
		{
			container.addChild(node.display.displayObject as DisplayObject);
		}
		
		override public function update(time:Number):void 
		{
			var node:TileRenderNode;
			var position:Position;
			var display:TileDisplay;
			var displayObject:ITileView;
			
			for (node = nodes.head; node; node = node.next)
			{
				display = node.display;
				displayObject = display.displayObject;
				position = node.position;
				
				(displayObject as DisplayObject).x = position.position.x;
				(displayObject as DisplayObject).y = position.position.y;
				
				displayObject.updateDirection(position.direction);

				//TRY LANG
				
				
			}
		}

	}

}