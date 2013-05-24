package com.poddcorp.towerdef.UI

{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import com.poddcorp.towerdef.UIAssets;
	import flash.system.fscommand;
	import feathers.controls.Callout;
	import starling.text.TextField;
	
	/*...
	 * @author janssen
	 */
	
	public class QuitGame extends Sprite
	{
		private var btnYes:Button;
		public var btnNo:Button;
		private var _Message:Image;
		
		private var _parentCallOut:Callout;
		public var Click:ButtonClickTone = new ButtonClickTone();
		public function QuitGame()
		{
			Display();
		
		}
		
		public function Display():void
		{
			
			_Message = new Image(UIAssets.getAtlas().getTexture("ConfirmationMessage"));
			this.addChild(_Message);
			
			//quit pop up buttons
			btnYes = new Button(UIAssets.getAtlas().getTexture("btn_yespop"));
			btnYes.x = _Message.x + 27;
			btnYes.y = _Message.y + 175;
			this.addChild(btnYes);
			
			btnNo = new Button(UIAssets.getAtlas().getTexture("btn_nopop"));
			btnNo.x = btnYes.x + 90;
			btnNo.y = btnYes.y + 3;
			this.addChild(btnNo);
			
			btnYes.addEventListener(Event.TRIGGERED, onYes);
			btnNo.addEventListener(Event.TRIGGERED, closeThis)
		
		}
		
		private function onYes():void
		{
			addChild(Click);
			trace("You Click Yes.. Game will Quit");
			fscommand("quit");
			
		}
		
		public function closeThis():void
		{
			addChild(Click);
			_parentCallOut.close();

		}
		
		public function get parentCallOut():Callout
		{
			return _parentCallOut;
		}
		
		public function set parentCallOut(value:Callout):void
		{
			_parentCallOut = value;
		}
	
	}

}