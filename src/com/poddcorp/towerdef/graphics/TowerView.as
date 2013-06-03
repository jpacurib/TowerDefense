package com.poddcorp.towerdef.graphics
{
	import com.poddcorp.towerdef.UI.TowerUpgrade;
	import com.poddcorp.towerdef.UIAssets;
	import feathers.controls.Callout;
	import flash.desktop.InteractiveIcon;
	import flash.events.Event;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	
	/**
	 * Tower Graphics Class
	 *
	 */
	public class TowerView extends Sprite implements ITileView
	{
		//Declares image variable for basic tower
		private var tower_basic:Image;
		
		//Declares image variable for stone tower
		private var tower_stone:Image;
		
		//Declares image variable for metal tower
		private var tower_metal:Image;
		
		//Declares direction variable for changing graphics of the tower
		private var direction:String;
		
		//Declares content variable as TowerUpgrade Class
		private var content:TowerUpgrade = new TowerUpgrade();
		
		//Declares callout menu for tower menu
		private var towerCallOut:Callout;
		
		private var upgrade:int = 0;
		
		public function TowerView()
		{
			//sets initial direction as basic
			direction = 'basic';
			
			//Sets image for each tower from the spritesheet
			tower_basic = new Image(UIAssets.getAtlas().getTexture("tower_basic"));
			tower_stone = new Image(UIAssets.getAtlas().getTexture("tower_stone"));
			tower_metal = new Image(UIAssets.getAtlas().getTexture("tower_metal"));
			
			//Adds graphic images to stage
			this.addChild(tower_basic);
			this.addChild(tower_stone);
			this.addChild(tower_metal);
			
			//Set visibility of upgraded towers to false
			tower_stone.visible = false;
			tower_metal.visible = false;
			
			//Adds listener for every tower if touched
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		
		}
		
		//Handler function for TouchEvent
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
						showTowerMenu(e.currentTarget);
						break;
					default: 
				}
			}
		}
		
		//Shows tower menu if tower is touched
		public function showTowerMenu(target:EventDispatcher):void
		{
			if (direction == 'metal')
			{
				content.removeChild(content.btnUpgrade);
			}
			Callout.show(content, this, "any", false, null);
			
			content.btnUpgrade.addEventListener(TouchEvent.TOUCH, onTouchUpgrade);
			content.btnSell.addEventListener(TouchEvent.TOUCH, onTouchSell);
		
		}
		
		private function onTouchSell(e:TouchEvent):void
		{
		
		}
		
		private function onTouchUpgrade(e:TouchEvent):void
		{
			if (upgrade == 1)
			{
				if (direction == 'stone')
				{
					updateDirection("metal");
					direction = "metal";
				}
			}
			
			else
			{
				if (direction == 'basic')
				{
					updateDirection("stone");
					direction = "stone";
					upgrade++;
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
					tower_stone.visible = false;
					tower_metal.visible = true;
					break;
				default: 
			}
		}
	
	}

}