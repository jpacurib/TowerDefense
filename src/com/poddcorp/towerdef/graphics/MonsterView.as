package com.poddcorp.towerdef.graphics 
{
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import com.poddcorp.towerdef.UIAssets;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class MonsterView extends Sprite
	{
		private var monsterShape:Shape = new Shape();
		
		public function MonsterView() 
		{
			monsterShape.graphics.lineStyle(1);
			monsterShape.graphics.beginFill(0x00FF00);
			//monsterShape.graphics.drawRect(0, 0, 32, 32);
			monsterShape.graphics.drawEllipse(0, 0, 32, 32);
			monsterShape.graphics.endFill();
			
			var bmpData:BitmapData = new BitmapData(monsterShape.width, monsterShape.height);
			bmpData.draw(monsterShape);
			
			this.addChild(new Image(Texture.fromBitmapData(bmpData)));
		}	
	}

}