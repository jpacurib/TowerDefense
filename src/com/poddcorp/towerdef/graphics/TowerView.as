package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerView extends Sprite implements ITileView
	{
		private var basic_tower:Image;
		
		public function TowerView() 
		{
			basic_tower = new Image(UIAssets.getAtlas().getTexture("tower_basic"));
			this.addChild(basic_tower);
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			
		}
		
	}

}