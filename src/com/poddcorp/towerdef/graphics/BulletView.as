package com.poddcorp.towerdef.graphics 
{
	import com.poddcorp.towerdef.UIAssets;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * Bullet Graphics Class for display in the stage
	 * 
	 */
	public class BulletView extends Sprite implements ITileView
	{
		//Declares image for arrow going east
		private var arrowEast:Image;
		
		//Declares image for arrow going west
		private var arrowWest:Image;
		
		//Declares image for arrow going north east
		private var arrowNorthEast:Image;
		
		//Declares image for arrow going south east
		private var arrowSouthEast:Image;
		
		//Declares image for arrow going north
		private var arrowNorth:Image;
		
		//Declares image for arrow going south
		private var arrowSouth:Image;
		
		//Declares image for arrow going north west
		private var arrowNorthWest:Image;
		
		//Declares image for arrow going south west
		private var arrowSouthWest:Image;
		
		public function BulletView() 
		{			
			//Sets display to a new image in Spritesheet
			arrowEast = new Image(UIAssets.getAtlas().getTexture("arrow_E"));
			arrowWest = new Image(UIAssets.getAtlas().getTexture("arrow_W"));
			
			arrowNorthEast = new Image(UIAssets.getAtlas().getTexture("arrow_NE"));
			arrowSouthEast = new Image(UIAssets.getAtlas().getTexture("arrow_SE"));
			
			arrowNorth = new Image(UIAssets.getAtlas().getTexture("arrow_N"));
			arrowSouth = new Image(UIAssets.getAtlas().getTexture("arrow_S"));
			
			arrowNorthWest = new Image(UIAssets.getAtlas().getTexture("arrow_NW"));
			arrowSouthWest = new Image(UIAssets.getAtlas().getTexture("arrow_SW"));
			
			//Adds all display to the stage
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
		
		//Hides all arrow images
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
		
		//Changes image of arrow in every update in direction
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