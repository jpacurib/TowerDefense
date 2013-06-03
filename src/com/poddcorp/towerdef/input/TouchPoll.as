package com.poddcorp.towerdef.input
{
	import ash.core.NodeList;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.IsoMap;
	import com.poddcorp.towerdef.UI.TowerButton;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.events.ResizeEvent;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TouchPoll extends Sprite
	{
		[Inject]
		public var creator:EntityCreator;
		
		[Inject]
		public var map:IsoMap;
		
		public var myStage:Stage = Starling.current.nativeStage;
		
		private var _displayObject:DisplayObject;
		private var viewPort:Rectangle = Starling.current.viewPort;
		
		public function TouchPoll(displayObject:DisplayObject)
		{
			_displayObject = displayObject;
			_displayObject.addEventListener(TouchEvent.TOUCH, onTouchEvent);
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, onResize);
		}
		
		private function onResize(e:ResizeEvent):void
		{
			viewPort = Starling.current.viewPort;
		}
		
		private function onTouchEvent(e:TouchEvent):void
		{
			var touchVector:Vector.<Touch> = e.getTouches(_displayObject);
			
			if (touchVector.length == 1)
			{
				var touch:Touch = touchVector[0];
				var target:EventDispatcher = touch.target;
				var className:String = getQualifiedClassName(target);
				var dspButton:DisplayObject = e.target as DisplayObject;
				
				switch (touch.phase)
				{
					case TouchPhase.BEGAN: 
						towerTouchBegan();
						break;
					
					case TouchPhase.MOVED: 
						towerTouchMoved(dspButton, touchVector);
						break;
					
					case TouchPhase.ENDED: 
						towerTouchEnded(dspButton, touchVector);
						break;
					default: 
				}
			}
		}
		
		private function towerTouchEnded(displayButton:DisplayObject, touchVector:Vector.<Touch>):void
		{
			if (displayButton.name == "")
			{
				displayButton.x = viewPort.width - 200;
				displayButton.y = viewPort.height - 200;
				
				for each (var touch:Touch in touchVector)
				{
					map.onTouchEnded(touchVector, touch);
					//trace(map.onTouchEnded(touchVector, touch));
				}
			}
		}
		
		private function towerTouchMoved(displayButton:DisplayObject, touchVector:Vector.<Touch>):void
		{
			if (displayButton.name == "")
			{
				displayButton.x = (touchVector[0].globalX - 64);
				displayButton.y = (touchVector[0].globalY - 64);
			}
		}
		
		private function towerTouchBegan():void
		{
		
		}
	
	}

}