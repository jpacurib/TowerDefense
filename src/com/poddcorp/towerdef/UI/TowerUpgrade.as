package com.poddcorp.towerdef.UI 
{
	import com.poddcorp.towerdef.EntityCreator;
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerUpgrade extends Sprite
	{
		public var btnUpgrade:Button;
		public var btnSell:Button;
		
		public function TowerUpgrade() 
		{
			btnUpgrade = new Button(UIAssets.getAtlas().getTexture("hud_upgrade"));
			btnSell = new Button(UIAssets.getAtlas().getTexture("hud_sell"));
			
			this.addChild(btnSell);
			this.addChild(btnUpgrade);
			
			btnUpgrade.x = 50;
			btnSell.x = 0;
		}
		
	}

}