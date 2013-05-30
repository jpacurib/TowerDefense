package com.poddcorp.towerdef.input
{
	import ash.core.NodeList;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.UI.TowerButton;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
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
		
		public var myStage:Stage = Starling.current.nativeStage;
		
		private var _displayObject:DisplayObject;
		private var _stage:Stage = Starling.current.nativeStage;
		
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
		
		public function towerTouchBegan():void
		{
			trace("began");
		}
		
		public function towerTouchMoved(displayButton:DisplayObject, touchVector:Vector.<Touch>):void
		{
			if (displayButton.name == "")
			{
				displayButton.x = (touchVector[0].globalX - 64) ;
				displayButton.y = (touchVector[0].globalY - 64) ;
			}
		}
		
		public function towerTouchEnded(displayButton:DisplayObject, touchVector:Vector.<Touch>):void
		{
			trace("ended");
			if (displayButton.name == "")
			{			
				var pt:Point = new Point(touchVector[0].globalX, touchVector[0].globalY);
				
				//Tower Snapping to Grid Coordinates
				var positionToGrid:Point = new Point(Math.floor(pt.x / 128) * 128 - 45, Math.floor(pt.y / 64) * 64 - 15);
				
				positionToGrid.x = positionToGrid.x - (myStage.stageWidth / 2) - 60;
				positionToGrid.y = positionToGrid.y - (myStage.stageHeight / 5) + 10;
				
				creator.createTower(positionToGrid);
				
				//Returns display button to original position
				displayButton.x = _stage.stageWidth - 150;
				displayButton.y = _stage.stageHeight - 200;
				
				/*displayButton.x = positionToGrid.x;
				displayButton.y = positionToGrid.y;*/
			}
		}
	
		//PATH FINDING
	
	}

}