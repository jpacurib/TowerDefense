package  
{
	import starling.display.Button;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import GameUI;
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
		
		private var heightButton:Number = 50;
		private var widthButton:Number = 250;
		
		public function InGame() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, gameAddedToStage);
		}
		
		private function gameAddedToStage(e:Event):void 
		{
			createIngameButton();
			addChild(btnPause);
		}
		
		private function createIngameButton():void 
		{
			btnPause = new Button(UIAssets.getUITexture("pause"));
			btnResume = new Button(UIAssets.getUITexture("btnOrange"));
			btnSettings = new Button(UIAssets.getUITexture("btnRed"));
			btnBackMainMenu = new Button(UIAssets.getUITexture("btnYellow"));
			btnBack = new Button(UIAssets.getUITexture("btnBlue"));
			
			btnResume.text = ("RESUME");
			btnSettings.text = ("SETTINGS");
			btnBackMainMenu.text = ("BACK TO MAIN MENU");
			btnBack.text = ("BACK");
			
			btnResume.x = (stage.stageWidth / 2) - (widthButton / 2);
			btnSettings.x = btnResume.x;
			btnBackMainMenu.x = btnResume.x;
			btnPause.x = 0;
			btnBack.x = btnBackMainMenu.x;
			
			btnResume.y = 300;
			btnSettings.y = btnResume.y + 75;
			btnBackMainMenu.y = btnSettings.y + 75;
			btnPause.y = 0;
			btnBack.y = btnBackMainMenu.y;
			
			btnPause.addEventListener(Event.TRIGGERED, onPauseEvent);
			btnResume.addEventListener(Event.TRIGGERED, onResumeEvent);
			btnSettings.addEventListener(Event.TRIGGERED, onSettingsEvent);
			btnBackMainMenu.addEventListener(Event.TRIGGERED, onBackMainMenuEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
			
			
		}
		
		private function onBackEvent(e:Event):void 
		{
			this.removeChild(btnBack);
			showPauseMenu();
		}
		
		private function onBackMainMenuEvent(e:Event):void 
		{
			var backtoGameUI:GameUI = new GameUI();
			addChild(backtoGameUI);
			
			removeAllMenu();
			removeChild(btnPause);
		}
		
		private function onSettingsEvent(e:Event):void 
		{
			removeAllMenu();
			onSettingButtons();
		}
		
		private function onSettingButtons():void 
		{
			//var settingUI:GameUI = new GameUI();
			
			//addChild(settingUI.tabQuality);
			//addChild(settingUI.sliderVolume);
			//addChild(settingUI.labelVol);
			this.addChild(btnBack);
		}
		
		private function onResumeEvent(e:Event):void 
		{
			removeAllMenu();
		}
		
		private function removeAllMenu():void 
		{
			this.removeChild(btnResume);
			this.removeChild(btnSettings);
			this.removeChild(btnBackMainMenu);
		}
		
		private function onPauseEvent(e:Event):void 
		{
			showPauseMenu();
		}
		
		private function showPauseMenu():void 
		{
			this.addChild(btnResume);
			this.addChild(btnSettings);
			this.addChild(btnBackMainMenu);
		}
		
	}

}