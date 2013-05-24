package com.poddcorp.towerdef.UI
{
	//import adobe.utils.CustomActions;
	import com.poddcorp.towerdef.Main;
	//import flash.automation.StageCaptureEvent;
	import starling.core.Starling;
	import flash.display.Stage;
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
		
		public var Click:ButtonClickTone = new ButtonClickTone();
		public var SliderObject:SharedObject;
		public var TabObject:SharedObject;
		public var slider:Slider;
		public var tab:TabBar
		private var SetImage:Image;
		private var Titleimg:Image;
		private var _music:BGmusic;
		
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
			var nativeStage:Stage = Starling.current.nativeStage;
			
			SetImage = new Image(UIAssets.getUITexture("SETTINGS"));
			this.addChild(SetImage);
			SetImage.x = (nativeStage.stageWidth - SetImage.width) / 2;
			SetImage.y = (nativeStage.stageHeight / 2) - (SetImage.height - 260);
			
			Titleimg = new Image(UIAssets.getUITexture("TitleMenu"));
			Titleimg.x = (nativeStage.stageWidth - Titleimg.width) / 2;
			this.addChild(Titleimg);
			
			//Volume Label
			vol = new Image(UIAssets.getAtlas().getTexture("img_Volume"));
			vol.x = (nativeStage.stageWidth - vol.width) / 2;
			vol.y = (nativeStage.stageHeight / 2) - vol.height - 100;
			this.addChild(vol);
			
			//slider Volume
			sliderVolume = new Slider();
			sliderVolume.minimum = 0;
			sliderVolume.maximum = 100;
			sliderVolume.setSize(300, 50);
			sliderVolume.step = 1;
			sliderVolume.x = (nativeStage.stageWidth - sliderVolume.width) / 2;
			sliderVolume.y = vol.y + 75;
			sliderVolume.useHandCursor = true;
			//sliderVolume.liveDragging = true;
			this.addChild(sliderVolume);
			
			//Quality Label
			qlty = new Image(UIAssets.getAtlas().getTexture("img_Quality"));
			qlty.x = (nativeStage.stageWidth - qlty.width) / 2;
			qlty.y = vol.y + 150;
			this.addChild(qlty);
			
			var firstVal:String = new String("Low");
			var secondVal:String = new String("Medium");
			var thirdVal:String = new String("High");
			
			//tab bar Quality
			tabQuality = new TabBar();
			tabQuality.dataProvider = new ListCollection([{label: firstVal}, {label: secondVal}, {label: thirdVal}]);
			tabQuality.useHandCursor = true;
			tabQuality.x = (nativeStage.stageWidth - tabQuality.width) / 2 - 150;
			tabQuality.y = qlty.y + 75;
			
			tabQuality.setSize(300, 50);
			this.addChild(tabQuality);
			
			sliderVolume.addEventListener(Event.CHANGE, slider_changeHandler)
			tabQuality.addEventListener(Event.CHANGE, tabs_changeHandler);
			
			SliderObject = SharedObject.getLocal("ShareObjct");
			sliderVolume.value = SliderObject.data.value;
			
			TabObject = SharedObject.getLocal("TabDetailObject");
			tabQuality.selectedIndex = TabObject.data.tabvalue;
			//var TabIndex:Number = new Number();
			// TabIndex = TabObject.data.tabvalue;
			//trace(TabIndex);
		}
		
		private function tabs_changeHandler(event:Event):void
		{
			tab = TabBar(event.currentTarget);
			TabObject = SharedObject.getLocal("TabDetailObject");
			TabObject.data.tabvalue = tab.selectedIndex;
			addChild(Click);
			trace("tab.value change:", tab.selectedIndex)
		}
		
		public function slider_changeHandler(event:Event):void
		{
			
			slider = Slider(event.currentTarget);
			
			SliderObject = SharedObject.getLocal("ShareObjct");
			
			_music = new BGmusic();
			SliderObject.data.value = sliderVolume.value;
			SliderObject.flush();
			
			//trace(SliderObject.data.value);
			trace("slider.value changed:", slider.value);
		
		}
	
	}

}