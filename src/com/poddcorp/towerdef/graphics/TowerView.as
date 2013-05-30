package com.poddcorp.towerdef.graphics
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerView extends Sprite implements ITileView
	{
		private var tower_basic:Image;
		private var tower_stone:Image;
		private var tower_metal:Image;
		
		public function TowerView()
		{
			tower_basic = new Image(UIAssets.getAtlas().getTexture("tower_basic"));
			
			tower_stone = new Image(UIAssets.getAtlas().getTexture("tower_stone"));
			
			tower_metal = new Image(UIAssets.getAtlas().getTexture("tower_metal"));
			
			this.addChild(tower_basic);
			
			//
			this.addChild(tower_stone);
			this.addChild(tower_metal);
			
			//Set visibility of upgraded towers to false
			tower_stone.visible = false;
			tower_metal.visible = false;
			
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(this);
			for each (var touch:Touch in touches)
			{
				switch (touch.phase)
				{
					case TouchPhase.BEGAN:
						
						break;
					case TouchPhase.MOVED: 
						break;
					
					case TouchPhase.ENDED:
					
					default: 
				}
			}
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void
		{
			switch (direction)
			{
				case 'stone': 
					tower_basic.visible = false;
					tower_stone.visible = true;
					break;
				
				case 'metal': 
					tower_basic.visible = false;
					tower_metal.visible = true;
					break;
				default: 
			}
		}
	
	}

}