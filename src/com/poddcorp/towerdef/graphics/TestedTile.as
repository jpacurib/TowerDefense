package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TestedTile extends Image
	{
		
		public function TestedTile() 
		{
			super(UIAssets.getUITexture('tile'));
			this.touchable = false;
		}
		
	}

}