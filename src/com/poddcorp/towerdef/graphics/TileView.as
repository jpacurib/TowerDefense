package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileView extends Image
	{
		public function TileView()
		{
			super(UIAssets.getUITexture("tile"));
			this.touchable = true;
			//this.addEventListener(TouchEvent.TOUCH, onTriggerClick);
		}
			
	}

}