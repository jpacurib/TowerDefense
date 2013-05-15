package com.poddcorp.towerdef.input 
{
	import flash.utils.getQualifiedClassName;
	import starling.display.DisplayObject;
	import starling.events.EventDispatcher;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	/**
	 * ...
	 * @author ...
	 */
	public class TouchPoll 
	{
		private var _displayObject:DisplayObject;
		private var isPressed:Boolean = false;
		
		public function TouchPoll(displayObject:DisplayObject) 
		{
			_displayObject = displayObject;
			_displayObject.addEventListener(TouchEvent.TOUCH, onTouchEvent);
		}
		
		private function onTouchEvent(e:TouchEvent):void 
		{
			var touchVector:Vector.<Touch> = e.getTouches(_displayObject);
			
			if (touchVector.length == 1)
			{
				var touch:Touch = touchVector[0];
				var target:EventDispatcher = touch.target;
				var className:String = getQualifiedClassName(target);
				
				if (touch.phase == TouchPhase.BEGAN)
				{
					isPressed = (className == "com.poddcorp.towerdef.graphics::TileView");
				}
				else if (touch.phase == TouchPhase.ENDED)
				{
					isPressed = !(className == "com.poddcorp.towerdef.graphics::TileView");
				}
			}
		}
		
	}

}