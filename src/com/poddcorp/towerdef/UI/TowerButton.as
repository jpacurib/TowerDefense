package com.poddcorp.towerdef.UI 
{
	import com.poddcorp.towerdef.UIAssets;
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TowerButton extends Button
	{
		
		public function TowerButton() 
		{
			super();
			this.defaultSkin = myDefaultSkin();
			this.hoverSkin = myHoverSkin();
		}
		
		private function myDefaultSkin():Image 
		{
			var texture:Texture = UIAssets.getAtlas().getTexture("btn_Pause");
			return new Image(texture);
		}
		
		private function myHoverSkin():Image
		{
			var texture:Texture = UIAssets.getAtlas().getTexture("btn_Play");
			return new Image(texture);
		}
		
	}

}