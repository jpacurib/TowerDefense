package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class BulletView extends Sprite implements ITileView
	{
		private var arrowEast:Image;
		private var arrowWest:Image;
		
		private var arrowNorthEast:Image;
		private var arrowSouthEast:Image;
		
		private var arrowNorth:Image;
		private var arrowSouth:Image;
		
		private var arrowNorthWest:Image;
		private var arrowSouthWest:Image;
		
		public function BulletView() 
		{			
			arrowEast = new Image(UIAssets.getAtlas().getTexture("arrow_E"));
			arrowWest = new Image(UIAssets.getAtlas().getTexture("arrow_W"));
			
			arrowNorthEast = new Image(UIAssets.getAtlas().getTexture("arrow_NE"));
			arrowSouthEast = new Image(UIAssets.getAtlas().getTexture("arrow_SE"));
			
			arrowNorth = new Image(UIAssets.getAtlas().getTexture("arrow_N"));
			arrowSouth = new Image(UIAssets.getAtlas().getTexture("arrow_S"));
			
			arrowNorthWest = new Image(UIAssets.getAtlas().getTexture("arrow_NW"));
			arrowSouthWest = new Image(UIAssets.getAtlas().getTexture("arrow_SW"));
			
			addChild(arrowEast);
			addChild(arrowWest);
			addChild(arrowNorth);
			addChild(arrowSouth);
			addChild(arrowNorthEast);
			addChild(arrowSouthEast);
			addChild(arrowNorthWest);
			addChild(arrowSouthWest);
			
			hideAllArrows();
		}
		
		private function hideAllArrows():void 
		{
			arrowEast.visible = false;
			arrowWest.visible = false;
			arrowNorth.visible = false;
			arrowSouth.visible = false;
			arrowNorthEast.visible = false;
			arrowSouthEast.visible = false;
			arrowNorthWest.visible = false;
			arrowSouthWest.visible = false;
		}
		
		/* INTERFACE com.poddcorp.towerdef.graphics.ITileView */
		
		public function updateDirection(direction:String):void 
		{
			hideAllArrows();
			
			switch (direction) 
			{
				case 'N':
					arrowNorth.visible = true;
					break;
					
				case 'NE':
					arrowNorthEast.visible = true;
					break;

				case 'NW':
					arrowNorthWest.visible = true;
					break;

				case 'S':
					arrowSouth.visible = true;
					break;

				case 'SE':
					arrowSouthEast.visible = true;
					break;

				case 'SW':
					arrowSouthWest.visible = true;
					break;

				case 'E':
					arrowEast.visible = true;
					break;

				case 'W':
					arrowNorthWest.visible = true;
					break;
	
				default:
					hideAllArrows();
					break;
			}
		}
		
	}

}