package com.poddcorp.towerdef
{
	import com.poddcorp.towerdef.pathfinding.INode;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class IsoTile extends Sprite implements INode
	{
		[Inject]
		public var creator:EntityCreator;
		
		private var _f:Number;
		private var _g:Number;
		private var _h:Number;
		private var _parentNode:INode;
		private var _traversable:Boolean;
		private var _row:int;
		private var _col:int;
		private var _tile:Image;
		
		public function IsoTile(row:int, col:int)
		{
			this.row = row;
			this.col = col;
			this.traversable = true;
			
			super();
			drawTile();
			this.height *= 0.5;
		}
		
		public function toString():String
		{
			return "IsoTile [" + row + ", " + col + ", " + traversable + "]";
		}
		
		private function drawTile():void
		{
			_tile = createTile(0xFFFFFF);
			addChild(_tile);
		}
		
		/* INTERFACE com.poddcorp.towerdef.pathfinding.INode */
		
		public function get row():int
		{
			return _row;
		}
		
		public function set row(value:int):void
		{
			_row = value;
		}
		
		public function get col():int
		{
			return _col;
		}
		
		public function set col(value:int):void
		{
			_col = value;
		}
		
		private function createTile(color:uint):Image
		{
			var s:Shape = new Shape();
			s.graphics.lineStyle(1, 0x000000);
			s.graphics.beginFill(color, .2);
			s.graphics.drawRect(0, 0, 90, 90);
			s.graphics.endFill();
						
			var bmd:BitmapData = new BitmapData(s.width, s.height);
			bmd.draw(s);
			
			var image:Image = new Image(Texture.fromBitmapData(bmd));
			image.rotation = 40.1;
			//image.alpha = 0;
			return image;
		}
		
		public function highlight(color:uint):void
		{
			if (_tile)
				if (this.contains(_tile))
					this.removeChild(_tile);
			
			_tile = createTile(color);
			this.addChild(_tile);
		}
				
		/* INTERFACE com.poddcorp.towerdef.pathfinding.INode */
		
		public function get f():Number
		{
			return _f;
		}
		
		public function get g():Number
		{
			return _g;
		}
		
		public function get h():Number
		{
			return _h;
		}
		
		public function get parentNode():INode
		{
			return _parentNode;
		}
		
		public function get traversable():Boolean
		{
			return _traversable;
		}
		
		public function set f(value:Number):void
		{
			_f = value;
		}
		
		public function set g(value:Number):void
		{
			_g = value;
		}
		
		public function set h(value:Number):void
		{
			_h = value;
		}
		
		public function set parentNode(value:INode):void
		{
			_parentNode = value;
		}
		
		public function set traversable(value:Boolean):void
		{
			_traversable = value;
		}
	
	}

}