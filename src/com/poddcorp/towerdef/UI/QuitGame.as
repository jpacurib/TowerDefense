package com.poddcorp.towerdef.UI

{
	
	import com.poddcorp.towerdef.GameUI;
	import flash.ui.Keyboard;
	
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
		private var btnor:Image;
		
		private var quitText:TextField;
	
		
		public function QuitGame()
		{
			Display();
		
		}
		
		public function Display():void
		{
			
			quitText = new TextField(300, 150, "ARE YOU AFRAID TO DEFEND?", "myFont", 40, 0xDF8C4F);
			this.addChild(quitText);
			
			
			//quit pop up buttons
			btnYes = new Button(UIAssets.getUITexture("yes"));
			btnYes.x = quitText.x + 55;
			btnYes.y = quitText.y + 150;
			this.addChild(btnYes);
			
			btnor = new Image(UIAssets.getUITexture("or"));
			this.addChild(btnor);
			btnor.x = btnYes.x + 75;
			btnor.y = btnYes.y;
			
			btnNo = new Button(UIAssets.getUITexture("no"));
			btnNo.x = btnor.x +35;
			btnNo.y = btnYes.y;
			this.addChild(btnNo);
			
		
			btnYes.addEventListener(Event.TRIGGERED, onYes);
			//btnNo.addEventListener(Event.CLOSE, closeThis);
		
		//	btnNo.addEventListener(Event.TRIGGERED, closeThis)
		
			//var hit:GameUI = new GameUI();
			// hit.callout.closeOnKeys = new <uint>[Keyboard.ENTER];
		}
		
		
//	public function closeThis():void
	//	{
			

			
			
		//	trace ("close");
		
		//}
		
		
		private function onYes():void
		{
			trace ("You Click Yes.. Game will Quit");
			fscommand("quit");
		}
	
		
	}

}