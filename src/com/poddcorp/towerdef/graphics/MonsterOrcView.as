package com.poddcorp.towerdef.graphics
{
	
	import com.poddcorp.towerdef.components.Position;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import com.poddcorp.towerdef.UIAssets;
	
	/**
	 * Orc Monster Graphics Class for display in the stage
	 * 
	 */
	public class MonsterOrcView extends Sprite implements ITileView
	{
		//Declares a movieclip handler for every direction
		private var movingNorth:MovieClip;
		private var movingNorthEast:MovieClip;
		private var movingNorthWest:MovieClip;
		private var movingSouth:MovieClip;
		private var movingSouthEast:MovieClip;
		private var movingSouthWest:MovieClip;
		private var movingEast:MovieClip;
		private var movingWest:MovieClip;
		
		public function MonsterOrcView()
		{					
			//Sets pivot of the class
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
			
			//Sets movieclip graphics of variables from the spritesheet
			movingNorth = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_back_NE"), 20);
			
			movingNorthEast = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_back_NE"), 20);
			movingNorthWest = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_back_NW"), 20);
			
			movingSouth = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_back_NE"), 20);
			
			movingSouthEast = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_SE"), 20);
			movingSouthWest = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_SW"), 20);
			
			movingEast = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_SE"), 20);
			movingWest = new MovieClip(UIAssets.getAtlas().getTextures("Orc-minions_SW"), 20);
			
			//Adds all movieclip to the stage
			addChild(movingNorth);
			addChild(movingNorthEast);
			addChild(movingNorthWest);
			addChild(movingSouth);
			addChild(movingSouthEast);
			addChild(movingSouthWest);
			addChild(movingEast);
			addChild(movingWest);
			
			hideAllAnimation();
		}
		
		//Hides all movieclips
		private function hideAllAnimation():void {
			movingNorth.visible = false;
			movingNorthEast.visible = false;
			movingNorthWest.visible = false;
			movingSouth.visible = false;
			movingSouthEast.visible = false;
			movingSouthWest.visible = false;
			movingEast.visible = false;
			movingWest.visible = false;
		}
		
		//Changes image of orc monster in every update in direction
		public function updateDirection(direction:String):void
		{		
			hideAllAnimation();
			switch (direction) 
			{
				case 'N':
					movingNorth.visible = true;
					Starling.juggler.add(movingNorth);
					break;
					
				case 'NE':
					movingNorthEast.visible = true;
					Starling.juggler.add(movingNorthEast);
					break;

				case 'NW':
					movingNorthWest.visible = true;
					Starling.juggler.add(movingNorthWest);
					break;

				case 'S':
					movingSouth.visible = true;
					Starling.juggler.add(movingSouth);
					break;

				case 'SE':
					movingSouthEast.visible = true;
					Starling.juggler.add(movingSouthEast);
					break;

				case 'SW':
					movingSouthWest.visible = true;
					Starling.juggler.add(movingSouthWest);
					break;

				case 'E':
					movingEast.visible = true;
					Starling.juggler.add(movingEast);
					break;

				case 'W':
					movingWest.visible = true;
					Starling.juggler.add(movingWest);
					break;
	
				default:
					movingNorth.visible = true;
					Starling.juggler.add(movingNorth);
					break;
			}
		}
		
	}

}