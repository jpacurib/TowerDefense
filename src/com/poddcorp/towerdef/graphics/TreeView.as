package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TreeView extends Image
	{
		
		public function TreeView() 
		{
			super(UIAssets.getUITexture("lubi"));
			this.touchable = true;
		}
		
	}

}