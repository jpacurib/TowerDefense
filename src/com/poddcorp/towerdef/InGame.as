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
		private var Fieldtext :TextField;
		public var UIsettings:SettingsUI;
		private var btnNew:Button;
		private var _towerDefense:TowerDefense = new TowerDefense();
		
		private var backtoGameUI:GameUI
		public var Click:ButtonClickTone = new ButtonClickTone()
		public var gbg:Image;
		
		public var towerDef:Image;
				
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
			
			towerDef = new Image(UIAssets.getAtlas().getTexture("ingame_banner"));
			
			btnPlay.y = 30;
			btnPlay.x = 0;
			
			//	btnNew = new Button(UIAssets.getUITexture("NewGame")); //button for new game
			
			btnResume.text = ("RESUME");
			btnSettings.text = ("SETTINGS");
			btnBackMainMenu.text = ("MAIN MENU");
			btnBack.text = ("BACK");
			
			
			btnResume.fontName = "MyFont1";
			btnResume.fontColor = 0x0000FF;
			btnResume.fontBold = true;
			btnResume.fontSize = 25;
			
			btnSettings.fontName = "MyFont1";
			btnSettings.fontColor = 0x0000FF;
			btnSettings.fontBold = true;
			btnSettings.fontSize = 25;
			
			btnBackMainMenu.fontName = "MyFont1";
			btnBackMainMenu.fontColor = 0x0000FF;
			btnBackMainMenu.fontBold = true;
			btnBackMainMenu.fontSize = 25;
			
			btnBack.fontName = "MyFont1";
			btnBack.fontColor = 0x0000FF;
			btnBack.fontBold = true;
			btnBack.fontSize = 25;
			
			
			
			var nativeStage:Stage = Starling.current.nativeStage;
			
			/*Fieldtext = new TextField(500, 300, "Defense of the Kingdom", UIAssets.getFont().name, 50, 0xFFFFFF);
			
			Fieldtext.x = (nativeStage.stageWidth - Fieldtext.width) / 2;
			Fieldtext.y = -100
			Fieldtext.vAlign = VAlign.CENTER;
			Fieldtext.hAlign = HAlign.CENTER;
			this.addChild(Fieldtext);*/
			
			addChild(towerDef);
			towerDef.x = (nativeStage.stageWidth - towerDef.width) / 2;
			towerDef.y = 10;
			
			btnResume.x = (nativeStage.stageWidth - btnResume.width) / 2;
			btnSettings.x = btnResume.x;
			btnBackMainMenu.x = btnResume.x;
			btnPause.x = 0;
			btnBack.x = btnBackMainMenu.x;
			
			btnResume.y = 300;
			btnSettings.y = btnResume.y + 75;
			btnBackMainMenu.y = btnSettings.y + 75;
			btnPause.y = 30;
			btnBack.y = btnBackMainMenu.y + 250;
			
			btnPause.addEventListener(Event.TRIGGERED, onPauseEvent);
			btnResume.addEventListener(Event.TRIGGERED, onResumeEvent);
			btnSettings.addEventListener(Event.TRIGGERED, onSettingsEvent);
			btnBackMainMenu.addEventListener(Event.TRIGGERED, onBackMainMenuEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
	
					
			gbg = new Image(UIAssets.getUITexture("bgimge"));
			gbg.x = 0;
			gbg.y = 0;
		
		
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
			_towerDefense.stop();
		}
		
		private function showPauseMenu():void
		{
			addChild(Click);
			this.addChild(btnResume);
			this.addChild(btnSettings);
			this.addChild(btnBackMainMenu);
			
		}
		

	
	}

}