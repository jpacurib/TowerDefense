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
	import flash.geom.Rectangle;
	import starling.events.ResizeEvent;
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
		private var towerdefense:TowerDefense;
		
		public var Txt:BitmapFont;
		
		public var BtnClk:ButtonClickTone = new ButtonClickTone();
		public var BackGroundMusic:BGmusic = new BGmusic();
		
		public var nativeStage:Rectangle = Starling.current.viewPort;
		
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
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, onResize);
		}
		
		private function onResize(event:ResizeEvent):void
		{

			// UPDATE YOUR UI HERE
			trace("resized");
			updateUI();
			if (towerdefense)
			{
				towerdefense.updateUI();
			}
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
			
			btnStart.text = ("START");
			btnSetting.text = ("SETTINGS");
			btnHelp.text = ("HELP");
			btnExit.text = ("EXIT");
			btnBack.text = ("BACK");
			
			btnStart.fontName = "MyFont1";
			btnStart.fontColor = 0x0000FF;
			btnStart.fontBold = true;
			btnStart.fontSize = 25;
			
			btnSetting.fontName = "MyFont1";
			btnSetting.fontColor = 0x0000FF;
			btnSetting.fontBold = true;
			btnSetting.fontSize = 25;
			
			btnHelp.fontName = "MyFont1";
			btnHelp.fontColor = 0x0000FF;
			btnHelp.fontBold = true;
			btnHelp.fontSize = 25;
			
			btnExit.fontName = "MyFont1";
			btnExit.fontColor = 0x0000FF;
			btnExit.fontBold = true;
			btnExit.fontSize = 25;
			
			btnBack.fontName = "MyFont1";
			btnBack.fontColor = 0x0000FF;
			btnBack.fontBold = true;
			btnBack.fontSize = 25;
			
			//events
			btnStart.addEventListener(Event.TRIGGERED, onStartEvent);
			btnSetting.addEventListener(Event.TRIGGERED, onSettingEvent);
			btnExit.addEventListener(Event.TRIGGERED, onExitEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
			btnHelp.addEventListener(Event.TRIGGERED, onHelpMenu);
			
			
			
			//centered button X coordinate
			
			
			//Y coordinate config
			
			
			dok = new Image(UIAssets.getAtlas().getTexture("img_Title"));
			//trace(dok.pivotX, dok.pivotY);
			
			
			bg = new Image(UIAssets.getUITexture("bgimge"));
			this.addChild(bg);
			
			
			scrll = new Image(UIAssets.getAtlas().getTexture("img_Scroll"));
			
			//scrll.x = dok.x - 150;
			//Nxt = new Button(UIAssets.getAtlas().getTexture("btn_next"));
			//Nxt.x = stage.width - Nxt.width;
			//Nxt.y = (stage.height - Nxt.height) - 50;
			//Nxt.y = (nativeStage.height / 2)  - (Nxt.height - 260) ;
			//Prev = new Button(UIAssets.getAtlas().getTexture("btn_back"));
			//Prev.x = 0;
			//Prev.y = (stage.height - Prev.height) - 50;
			
			updateUI();
		}
		
		private function updateUI():void
		{
			btnStart.x = (nativeStage.width - btnStart.width) / 2;
			btnSetting.x = btnStart.x;
			btnExit.x = btnSetting.x;
			btnHelp.x = btnExit.x;
			btnBack.x = btnHelp.x;
			
			btnStart.y = (nativeStage.height / 2) + 50;
			btnSetting.y = btnStart.y + 75;
			btnHelp.y = btnSetting.y + 75;
			btnExit.y = btnHelp.y + 75;
			btnBack.y = btnHelp.y + 75;
			
			dok.x = (nativeStage.width - dok.width) / 2;
			dok.y = (nativeStage.height / 2) - dok.height;
			
			bg.x = (nativeStage.width - bg.width) * .5;
			bg.y = (nativeStage.height - bg.height) * .5;
			
			scrll.x = (nativeStage.width - scrll.width) * .5;
			scrll.y = (nativeStage.height - scrll.height) * .5;
			
			
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
			towerdefense = new TowerDefense();
			this.removeChildren(0, -1);
			if (!this.contains(towerdefense))
			{
				this.addChild(towerdefense);
				this.addChild(myGame);
			}
			MainMenuRemove();
			addChild(BtnClk);
			
			BackGroundMusic._content.stop();
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
