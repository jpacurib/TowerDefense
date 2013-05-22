package com.poddcorp.towerdef.UI 
{
	import flash.net.SharedObject;
	import starling.display.Sprite;
	
	import com.poddcorp.towerdef.GameUI;
	import feathers.data.ListCollection;
	import feathers.controls.Slider;
	import feathers.controls.TabBar;
	import starling.events.Event;
	import starling.display.Image;
	import com.poddcorp.towerdef.UIAssets;
	import feathers.controls.Label
	
	/**
	 * ...
	 * @author janssen
	 */
	public class SettingsUI extends Sprite 
	{
		
		private var vol:Image;
		private var qlty:Image;
		
		public var tabQuality:TabBar
		public var sliderVolume:Slider;
		public var labelVol:Label;
		public var varholder:Number;
		
		public var _Set:GameUI = new GameUI();
		public var mySharedObject:SharedObject;
		
		public function SettingsUI() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, gameAddedToStage);
		}
		
		private function gameAddedToStage(e:Event):void
		{
			SettingsDetail();
		
		}
		
		public function SettingsDetail():void
		{
			
			//Volume Label
			vol = new Image(UIAssets.getAtlas().getTexture("img_Volume"));
			vol.x = (stage.stageWidth / 2) - 275;
			vol.y = 225;
			this.addChild(vol);
			
			//slider Volume
			sliderVolume = new Slider();
			sliderVolume.minimum = 0;
			sliderVolume.maximum = 100;
			sliderVolume.setSize(300, 50);
			
			sliderVolume.step = 1;
			sliderVolume.x = (stage.stageWidth / 2) - 355;
			sliderVolume.y = vol.y + 75;
			sliderVolume.value = 50;
			this.addChild(sliderVolume);
			sliderVolume.useHandCursor = true;
			sliderVolume.addEventListener(Event.CHANGE, slider_changeHandler);
			
			
			
	
			//Quality Label
			qlty = new Image(UIAssets.getAtlas().getTexture("img_Quality"));
			qlty.x = (stage.stageWidth / 2) - (275);
			qlty.y = vol.y + 150;
			this.addChild(qlty);
			
			//tab bar Quality
			tabQuality = new TabBar();
			tabQuality.dataProvider = new ListCollection([{label: "Low"}, {label: "Medium"}, {label: "High"}]);
			tabQuality.useHandCursor = true;
			tabQuality.x = (stage.stageWidth / 2) - 355;
			tabQuality.y = qlty.y + 75;
			tabQuality.setSize(300, 50);
			this.addChild(tabQuality);
			
			tabQuality.addEventListener(Event.CHANGE, tabs_changeHandler);
		}
		
		private function tabs_changeHandler(e:Event):void
		{
			
		
			var tab:TabBar = TabBar(e.currentTarget);
			
		
			trace("tab.value change:", tab.selectedIndex);
		}
		
		public function slider_changeHandler(event:Event):void
		{

			
			var slider:Slider = Slider(event.currentTarget);
			
			mySharedObject = SharedObject.getLocal("ShareObjct");
			mySharedObject.data.value = sliderVolume.value;
			
			mySharedObject.flush();
			
			trace(mySharedObject.data.value);		
			trace("slider.value changed:", slider.value);
		
		}
		
	}

}