package com.poddcorp.towerdef.UI
{

	
	import com.poddcorp.towerdef.GameUI;
	import flash.sampler.NewObjectSample;
	import starling.display.Sprite;
	import feathers.controls.Label;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import com.poddcorp.towerdef.UIAssets;
	import flash.system.fscommand;
	import feathers.controls.Callout;
	/*...
	 * @author janssen
	 */
	public class QuitGame extends Sprite
	{
		private var btnYes:Button;
		private var btnor:Image;
		public var btnNo:Button;
	
		
		
		private static const CONTENT_TEXT:String = "ARE YOU AFRAID TO DEFEND?";
		
		public function QuitGame()
		{
			
			const content:Label = new Label();
			content.text = CONTENT_TEXT;
		
			this.addChild(content);
			
			//quit pop up
			btnYes = new Button(UIAssets.getUITexture("yes"));
			btnYes.100;
			this.addChild(btnYes);
			
			btnor = new Image(UIAssets.getUITexture("or"));
			this.addChild(btnor);
			btnor.x = btnYes.x + 75;
			
			btnNo = new Button(UIAssets.getUITexture("no"));
			btnNo.x = btnor.x +35;
			this.addChild(btnNo);
			
			
			btnYes.addEventListener(Event.TRIGGERED, onYes);
			btnNo.addEventListener(Event.TRIGGERED, onNo);
		}
		
		private function onNo(e:Event):void 
		{
			
			trace ("You choose to continue..");
		

			
		}
		private function onYes():void
		{
			trace ("You Click Yes.. Game will Quit");
			fscommand("quit");
		}
		
		
	}

}