package com.poddcorp.towerdef
{
	import com.poddcorp.towerdef.UI.QuitGame;
	import feathers.controls.Label;
	import flash.net.SharedObject;
	
	import feathers.themes.MetalWorksMobileTheme;
	
//	import starling.display.DisplayObject;
	import feathers.themes.AzureMobileTheme;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import com.poddcorp.towerdef.UI.SettingsUI;
	
	//import flash.desktop.NativeApplication;
	import feathers.controls.Callout;
	import flash.text.TextFormat;
	import starling.display.DisplayObject;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameUI extends Sprite
	{
		

		
		private var btnStart:Button;
		private var btnSetting:Button;
		public var btnExit:Button;
		private var btnBack:Button;
		private var btnHelp:Button;
		public var dok:Image;
		public var callout:Callout;
		//private var scrll:Image;
		
		private var heightButton:Number = 50;
		private var widthButton:Number = 650;
		
		public var bg:Image;
		private var myGame:InGame;
		private var UIsettings:SettingsUI;
		private var Quit:QuitGame;
		//private var Gametheme:MetalWorksMobileTheme;
		
		private var Gametheme:AzureMobileTheme;
		
		public function GameUI()
		{
			super();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			SetButtonSettings();
			MainMenuAdd();
			//this.Gametheme = new MetalWorksMobileTheme(this.stage);
			
			this.Gametheme = new AzureMobileTheme(this.stage);
		}
		
		public function MainMenuAdd():void
		{
			this.addChild(dok);
			this.addChild(btnStart);
			this.addChild(btnSetting);
			this.addChild(btnHelp);
			this.addChild(btnExit);
		}
		
		private function MainMenuRemove():void
		{
			this.removeChild(dok);
			this.removeChild(btnStart);
			this.removeChild(btnSetting);
			this.removeChild(btnHelp);
			this.removeChild(btnExit);
		}
		
		private function SetButtonSettings():void
		{
			//MAIN
			//setting textures
			btnStart = new Button(UIAssets.getUITexture("btnBlue"));
			btnSetting = new Button(UIAssets.getUITexture("btnBrown"));
			btnExit = new Button(UIAssets.getUITexture("btnGreen"));
			btnBack = new Button(UIAssets.getUITexture("btnRed"));
			btnHelp = new Button(UIAssets.getUITexture("btnHelp"));
			
			//texts
			btnStart.text = ("PLAY");
			btnSetting.text = ("SETTINGS");
			btnHelp.text = ("HELP");
			btnExit.text = ("EXIT");
			btnBack.text = ("BACK");
			
			//events
			btnStart.addEventListener(Event.TRIGGERED, onStartEvent);
			btnSetting.addEventListener(Event.TRIGGERED, onSettingEvent);
			btnExit.addEventListener(Event.TRIGGERED, onExitEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
			btnHelp.addEventListener(Event.TRIGGERED, onHelpMenu);
			
			//centered button X coordinate
			btnStart.x = (stage.stageWidth / 2) - (widthButton / 2);
			btnSetting.x = btnStart.x;
			btnExit.x = btnStart.x;
			btnHelp.x = btnExit.x;
			btnBack.x = btnHelp.x;
			
			//Y coordinate config
			btnStart.y = 300;
			btnSetting.y = btnStart.y + 75;
			btnHelp.y = btnSetting.y + 75;
			btnExit.y = btnHelp.y + 75;
			btnBack.y = btnHelp.y + 75;
			
			dok = new Image(UIAssets.getUITexture("dok"));
			dok.x = (stage.stageWidth / 2) - (widthButton / 2) - 125;
			dok.y = btnStart.y - 75;
			
			bg = new Image(UIAssets.getUITexture("bgimge"));
			this.addChild(bg);
			
			
			
			
			//var newSet:SettingsUI = new SettingsUI();
			//var InGameSet:InGame = new InGame();
			
			//newSet.sliderVolume.value =  mySharedObject.data.volvalue;
			
			
			
			var mySharedObject:SharedObject = SharedObject.getLocal("ShareObjct");
			mySharedObject.data.value = 100;
			mySharedObject.data.value2 = 200;
			mySharedObject.flush();
			trace(mySharedObject.data.value);
			trace(mySharedObject.data.value2);
		}
		
		private function onBackEvent(e:Event):void
		{
			removeChild(btnBack);
			removeChild(UIsettings);
			//removeChild(scrll);
			
			MainMenuAdd();
		}
		
		private function onStartEvent(e:Event):void
		{
			myGame = new InGame();
			this.addChild(myGame);
			MainMenuRemove();
		}
		
		private function onSettingEvent(e:Event):void
		{
			MainMenuRemove();
			onSettingMenus();
		
		}
		
		private function onHelpMenu(e:Event):void
		{
			MainMenuRemove();
			
			this.addChild(btnBack)
		
		}
		
		private function onSettingMenus():void
		{
			
			UIsettings = new SettingsUI();
			addChild(UIsettings);
			this.addChild(btnBack);
		}
		
		private function onExitEvent(e:Event):void
		{
			var button:Button = Button(e.currentTarget);
			var content:Sprite = new QuitGame();
			callout = Callout.show(content, button, Callout.DIRECTION_UP, function():Callout
				{
					callout = new Callout();
					callout.topArrowGap = 300;
					//callout.setSize(500, 500);
					callout.nameList.add("my-custom-callout");
					return callout;
				});
		}
	
	}

}