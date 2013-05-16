package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Button;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerView extends Button
	{
		
		public function TowerView() 
		{
			super(UIAssets.getUITexture('tower'));
			this.touchable = false;
		}
		
	}

}