package com.poddcorp.towerdef
{
	import com.poddcorp.towerdef.UI.ButtonClickTone;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.sampler.NewObjectSample;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import com.poddcorp.towerdef.UI.SettingsUI;
	import feathers.controls.Label;
	import com.poddcorp.towerdef.GameUI;
	import starling.display.Image;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.VAlign;
	import starling.utils.HAlign;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class InGame extends Sprite
	{
		private var btnPause:Button;
		private var btnResume:Button;
		private var btnSettings:Button;
		private var btnBackMainMenu:Button;
		private var btnBack:Button;
		public var btnPlay:Image;
		private var heightButton:Number = 50;
		private var widthButton:Number = 650;
		private var TExt:TextField;
		public var UIsettings:SettingsUI;
		private var btnNew:Button;
		private var _towerDefense:TowerDefense = new TowerDefense();
		
		private var backtoGameUI:GameUI
		public var Click:ButtonClickTone = new ButtonClickTone()
		public var gbg:Image;
				
		public function InGame()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, gameAddedToStage);
		}
		
		private function gameAddedToStage(e:Event):void
		{
			createIngameButton();
			//NewGame();
			addChild(btnPause);
		}
		
		private function createIngameButton():void
		{
			btnPause = new Button(UIAssets.getAtlas().getTexture("btn_Pause"));
			btnResume = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnSettings = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnBackMainMenu = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnBack = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnPlay = new Image(UIAssets.getAtlas().getTexture("btn_Play"));
			btnPlay.y = 30;
			btnPlay.x = 0;
			
			//	btnNew = new Button(UIAssets.getUITexture("NewGame")); //button for new game
			
			btnResume.text = ("RESUME");
			btnSettings.text = ("SETTINGS");
			btnBackMainMenu.text = ("BACK TO MAIN MENU");
			btnBack.text = ("BACK");
			
			var nativeStage:Stage = Starling.current.nativeStage;
			
			TExt = new TextField(500, 300, "Defense of the Kingdom", UIAssets.getFont().name, 50, 0x0000FF);
			
			TExt.x = (nativeStage.stageWidth - TExt.width) / 2;
			TExt.y = -100
			TExt.vAlign = VAlign.CENTER;
			TExt.hAlign = HAlign.CENTER;
			this.addChild(TExt);
			
			btnResume.x = (nativeStage.stageWidth - btnResume.width) / 2;
			btnSettings.x = btnResume.x;
			btnBackMainMenu.x = btnResume.x;
			btnPause.x = 0;
			btnBack.x = btnBackMainMenu.x;
			
			btnResume.y = 300;
			btnSettings.y = btnResume.y + 75;
			btnBackMainMenu.y = btnSettings.y + 75;
			btnPause.y = 30;
			btnBack.y = btnBackMainMenu.y + 210;
			
			btnPause.addEventListener(Event.TRIGGERED, onPauseEvent);
			btnResume.addEventListener(Event.TRIGGERED, onResumeEvent);
			btnSettings.addEventListener(Event.TRIGGERED, onSettingsEvent);
			btnBackMainMenu.addEventListener(Event.TRIGGERED, onBackMainMenuEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
	
					
			gbg = new Image(UIAssets.getUITexture("bgimge"));
		
		
		}
		
		private function onBackEvent(e:Event):void
		{
			this.removeChild(btnBack);
			this.removeChild(UIsettings);
			showPauseMenu();
			addChild(btnPlay);
			
		}
		
		private function onBackMainMenuEvent(e:Event):void
		{
			addChild(Click);
			this.addChild(new GameUI());
			this.removeAllMenu();
			this.removeChild(btnPause);
			this.removeChild(gbg);
			
		}
		
		private function onSettingsEvent(e:Event):void
		{
			removeAllMenu();
			onSettingButtons();
		
		}
		
		private function onSettingButtons():void
		{
			UIsettings = new SettingsUI();
			addChild(UIsettings);
			this.addChild(btnBack);
			addChild(Click);
			
			
		}
		
		private function onResumeEvent(e:Event):void
		{
			removeAllMenu();
			removeChild(btnPlay);
			addChild(btnPause);
			addChild(Click);
			removeChild(gbg);
				
		}
		
		private function removeAllMenu():void
		{
			this.removeChild(btnResume);
			this.removeChild(btnSettings);
			this.removeChild(btnBackMainMenu);
		
		}
		
		private function onPauseEvent(e:Event):void
		{
			this.addChild(gbg);
			showPauseMenu();
			removeChild(btnPause);
			addChild(btnPlay);
			addChild(Click);
		}
		
		private function showPauseMenu():void
		{
			addChild(Click);
			
			//this.addChild(btnNew);
			
			this.addChild(btnResume);
			this.addChild(btnSettings);
			this.addChild(btnBackMainMenu);
			
		}
		

	
	}

}