package com.poddcorp.towerdef
{
	//import adobe.utils.CustomActions;
	
	import com.poddcorp.towerdef.UI.BGmusic;
	import com.poddcorp.towerdef.UI.ButtonClickTone;
	import com.poddcorp.towerdef.UI.QuitGame;
	import com.poddcorp.towerdef.UI.SettingsUI;
	import feathers.controls.Label;
	import feathers.controls.Slider;
	import feathers.events.CollectionEventType;
	import feathers.events.FeathersEventType;
	import starling.text.BitmapFont;
	//import feathers.text.BitmapFontTextFormat;
	import starling.text.TextField;
	
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.net.SharedObject;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.textures.Texture;
	
	import flash.events.MouseEvent;
	import feathers.themes.AzureMobileTheme;
	//import feathers.controls.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import com.poddcorp.towerdef.UI.SettingsUI;
	import flash.media.SoundChannel;
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
		
		//private var _buttonTextFormat:BitmapFontTextFormat;
		
		private var btnStart:Button;
		private var btnSetting:Button;
		public var btnExit:Button;
		private var btnBack:Button;
		private var btnHelp:Button;
		public var dok:Image;
		public var callout:Callout;
		private var scrll:Image;
		
		private var heightButton:Number = 50;
		private var widthButton:Number = 650;
		
		public var bg:Image;
		private var myGame:InGame;
		public var UIsettings:SettingsUI;
		private var Quit:QuitGame;
		private var _ValueSlider:Slider;
		
		private var Gametheme:AzureMobileTheme;
		private var Nxt:Button;
		private var Prev:Button;
		
		public var Txt:BitmapFont;
		
		public var BtnClk:ButtonClickTone = new ButtonClickTone();
		public var BackGroundMusic:BGmusic = new BGmusic();
		
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
			this.Gametheme = new AzureMobileTheme(this.stage);
			this.addChild(this.BackGroundMusic);
		}
		
		public function MainMenuAdd():void
		{
			
			this.addChild(bg);
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
			btnStart = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			//btnStart = new feathers.controls.Button(
			btnSetting = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnExit = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnBack = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			btnHelp = new Button(UIAssets.getAtlas().getTexture("btn_Button"));
			
			//var _buttonTextFormat=new BitmapFontTextFormat("TSYT", 32 * this.scale,0xFFFFFF);
			//button.defaultLabelProperties.textFormat = new BitmapFontTextFormat( myBitmapFont );
			
			//btnStart.textFormat = new BitmapFontTextFormat(UIAssets.myGamefont)
			
			//var text:Label = new Label();
			//Txt = tex;
			
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
			
			var nativeStage:Stage = Starling.current.nativeStage;
			
			//centered button X coordinate
			btnStart.x = (nativeStage.stageWidth - btnStart.width) / 2;
			btnSetting.x = btnStart.x;
			btnExit.x = btnSetting.x;
			btnHelp.x = btnExit.x;
			btnBack.x = btnHelp.x;
			
			//Y coordinate config
			btnStart.y = (nativeStage.stageHeight / 2) + 50;
			btnSetting.y = btnStart.y + 75;
			btnHelp.y = btnSetting.y + 75;
			btnExit.y = btnHelp.y + 75;
			btnBack.y = btnHelp.y + 75;
			
			dok = new Image(UIAssets.getAtlas().getTexture("img_Title"));
			//trace(dok.pivotX, dok.pivotY);
			dok.x = (nativeStage.stageWidth - dok.width) / 2;
			dok.y = (nativeStage.stageHeight / 2) - dok.height;
			
			bg = new Image(UIAssets.getUITexture("bgimge"));
			this.addChild(bg);
			bg.x = (nativeStage.stageWidth - bg.width) * .5;
			bg.y = (nativeStage.stageHeight - bg.height) * .5;
			
			scrll = new Image(UIAssets.getAtlas().getTexture("img_Scroll"));
			//scrll.x = dok.x - 150;
			//Nxt = new Button(UIAssets.getAtlas().getTexture("btn_next"));
			//Nxt.x = stage.width - Nxt.width;
			//Nxt.y = (stage.height - Nxt.height) - 50;
			//Nxt.y = (nativeStage.stageHeight / 2)  - (Nxt.height - 260) ;
			//Prev = new Button(UIAssets.getAtlas().getTexture("btn_back"));
			//Prev.x = 0;
			//Prev.y = (stage.height - Prev.height) - 50;
		}
		
		private function onBackEvent(e:Event):void
		{
			removeChild(btnBack);
			removeChild(UIsettings);
			removeChild(scrll);
			MainMenuAdd();
			addChild(BtnClk);
		}
		
		private function onStartEvent(e:Event):void
		{
			myGame = new InGame();
			var towerdefense:TowerDefense = new TowerDefense();
			this.removeChildren(0, -1);
			if (!this.contains(towerdefense))
			{
				this.addChild(new TowerDefense());
				this.addChild(myGame);
			}
			MainMenuRemove();
			addChild(BtnClk);
		
		}
		
		private function onSettingEvent(e:Event):void
		{
			MainMenuRemove();
			onSettingMenus();
			addChild(BtnClk);
		}
		
		private function onHelpMenu(e:Event):void
		{
			addChild(BtnClk);
			MainMenuRemove();
			this.addChild(scrll);
			this.addChild(btnBack)
			//addChild(Nxt);
			//addChild(Prev);
		}
		
		public function onSettingMenus():void
		{
			UIsettings = new SettingsUI();
			addChild(UIsettings);
			this.addChild(btnBack);
		}
		
		private function onExitEvent(e:Event):void
		{
			addChild(BtnClk);
			var button:Button = Button(e.currentTarget);
			var content:QuitGame = new QuitGame();
			
			callout = Callout.show(content, button, Callout.DIRECTION_UP, function():Callout
				{
					callout = new Callout();
					callout.topArrowGap = 300;
					callout.nameList.add("my-custom-callout");
					return callout;
				
				});
			content.parentCallOut = callout;
		
		}
	
	}

}
