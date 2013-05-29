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
			var texture:Texture = UIAssets.getAtlas().getTexture("btn_Pause");
			return new Image(texture);
		}
		
		private function myHoverSkin():Image
		{
			var glow:BlurFilter = BlurFilter.createGlow();
			
			/*range.graphics.lineStyle(0, 0x000000);
			range.graphics.beginFill(0x00CC00, .2);
			range.graphics.drawEllipse(0, 0, 200, 200);
			range.graphics.endFill();
			
			var bmd:BitmapData = new BitmapData(range.width, range.height);
			bmd.draw(range);
			
			var image:Image = new Image(Texture.fromBitmapData(bmd));*/
			//
			var texture:Texture = UIAssets.getAtlas().getTexture("btn_Play");
			var image:Image = new Image(texture);
			image.filter = glow;
			return image;
		}
		
	}

}