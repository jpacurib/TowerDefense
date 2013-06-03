package com.poddcorp.towerdef.UI 
{
	import com.poddcorp.towerdef.UIAssets;
	import feathers.controls.Button;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerButton extends Button
	{
		//private var range:Shape = new Shape;
		public function TowerButton() 
		{
			super();
			this.defaultSkin = myDefaultSkin();
			this.downSkin = myHoverSkin();
		}
		
		private function myDefaultSkin():Image 
		{
			var texture:Texture = UIAssets.getAtlas().getTexture("tower_basic");
			return new Image(texture);
		}
		
		private function myHoverSkin():Image
		{
			var glow:BlurFilter = BlurFilter.createGlow();
			
			var texture:Texture = UIAssets.getAtlas().getTexture("tower_basic");
			var image:Image = new Image(texture);
			image.filter = glow;
			return image;
		}
		
	}

}