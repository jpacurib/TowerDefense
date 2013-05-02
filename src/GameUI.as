package
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.TouchEvent;
	import flash.system.fscommand;
	import feathers.themes.MetalWorksMobileTheme;
	
	import feathers.controls.TabBar;
	import feathers.controls.Label;
	import feathers.data.ListCollection;
	import feathers.controls.Slider;


	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameUI extends Sprite
	{
		
		private var btnStart:Button;
		private var btnSetting:Button;
		private var btnExit:Button;
		private var btnBack:Button;
		private var dok:Image;
		
		private var heightButton:Number = 50;
		private var widthButton:Number = 250;
		
		private var myGame:InGame;
		
		private var Gametheme:MetalWorksMobileTheme;
		public var tabQuality:TabBar
		public var sliderVolume:Slider;
		public var labelVol:Label;
	
		public function GameUI()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		private function onAddedtoStage(e:Event):void
		{
			SetButtonSettings();
			MainMenuAdd();
			this.Gametheme = new MetalWorksMobileTheme(this.stage);
		}
		
		private function MainMenuAdd():void
		{
			this.addChild(dok);
			this.addChild(btnStart);
			this.addChild(btnSetting);
			this.addChild(btnExit);
		}
		
		private function MainMenuRemove():void
		{
			this.removeChild(dok);
			this.removeChild(btnStart);
			this.removeChild(btnSetting);
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
			
			//texts
			btnStart.text = ("PLAY");
			btnSetting.text = ("SETTINGS");
			btnExit.text = ("EXIT");
			btnBack.text = ("BACK");
			
			//events
			btnStart.addEventListener(Event.TRIGGERED, onStartEvent);
			btnSetting.addEventListener(Event.TRIGGERED, onSettingEvent);
			btnExit.addEventListener(Event.TRIGGERED, onExitEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
			
			//centered button X coordinate
			btnStart.x = (stage.stageWidth / 2) - (widthButton / 2);
			btnSetting.x = btnStart.x;
			btnExit.x = btnStart.x;
			btnBack.x = btnExit.x;
			
			//Y coordinate config
			btnStart.y = 300;
			btnSetting.y = btnStart.y + 75;
			btnExit.y = btnSetting.y + 75;
			btnBack.y = btnExit.y;
			
			dok = new Image(UIAssets.getUITexture("dok"));
			dok.x = (stage.stageWidth / 2) - (250);
			dok.y = btnStart.y - 150;
			
			//tab bar Quality
			tabQuality = new TabBar();
			tabQuality.dataProvider = new ListCollection([{label: "Low"}, {label: "Medium"}, {label: "High"},]);
			tabQuality.x = (stage.stageWidth / 2) - 150;
			tabQuality.y = btnBack.y - 75;
			tabQuality.setSize(300, 50);
			this.tabQuality.x
			
			//slider Volume
			sliderVolume = new Slider();
			sliderVolume.minimum = 0;
			sliderVolume.maximum = 100;
			sliderVolume.value = 50;
			sliderVolume.setSize(300, 50);
			sliderVolume.x = (stage.stageWidth / 2) - 150;
			sliderVolume.y = btnBack.y - 150;
			sliderVolume.step = 1;
			this.sliderVolume.addEventListener(Event.CHANGE, slider_changeHandler);
			this.labelVol = new Label();
			this.labelVol.text = this.sliderVolume.value.toString();
			
			
		}
		
		public function slider_changeHandler(event:Event):void
		{
			this.labelVol.text = this.sliderVolume.value.toString();
		}
		
		private function onBackEvent(e:Event):void
		{
			removeChild(btnBack);
			removeChild(labelVol);
			removeChild(tabQuality);
			removeChild(sliderVolume);
			
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
		
		private function onSettingMenus():void
		{
			
			this.addChild(tabQuality);
			this.addChild(sliderVolume);
			this.addChild(labelVol);
			
			this.addChild(btnBack);
		}
		
		private function onExitEvent(e:Event):void
		{
			fscommand("quit");
		}
	
	}

}