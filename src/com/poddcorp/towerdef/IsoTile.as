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
		//Requests instance for Entity Creator
		[Inject]
		public var creator:EntityCreator;
		
		//Declares F cost variable
		private var _f:Number;
		
		//Declares G cost variable
		private var _g:Number;
		
		//Declares H cost variable
		private var _h:Number;
		
		//Declares Parent Node variable
		private var _parentNode:INode;
		
		//Declares Traversable variable
		private var _traversable:Boolean;
		
		//Declares Row variable
		private var _row:int;
		
		//Declares Column variable
		private var _col:int;
		
		//Declares Tile Image variable
		private var _tile:Image;
		
		/**
		 * Creates an Isometric Tile
		 * @param	row	Row of the tile.
		 * @param	col	Column of the tile.
		 */
		public function IsoTile(row:int, col:int)
		{
			//Sets local row to the value of the parameter row
			this.row = row;
			
			//Sets local col to the value of the parameter col
			this.col = col;
			
			//Sets local traversable as true
			this.traversable = true;
			
			super();
			
			//Draws an IsoTile
			drawTile();
			
			//Height of tile is equal to the height multiplied by 0.5 or 50%
			this.height *= 0.5;
		}
		
		/**
		 * Returns String IsoTile Properties
		 * @return	Returns row, column, and traversable properties
		 */
		public function toString():String
		{
			return "IsoTile [" + row + ", " + col + ", " + traversable + "]";
		}
		
		/**
		 * Draws tile
		 */
		private function drawTile():void
		{
			//Sets local tile as the return value of createtile function
			_tile = createTile(0xFFFFFF);
			
			//Adds tile to the stage
			addChild(_tile);
		}
		
		/* INTERFACE com.poddcorp.towerdef.pathfinding.INode */
		
		/**
		 * Gets row number
		 */
		public function get row():int
		{
			return _row;
		}
		
		/**
		 * Sets row number
		 */
		public function set row(value:int):void
		{
			//Sets local row variable value to value of parameter
			_row = value;
		}
		
		/**
		 * Gets column number
		 */
		public function get col():int
		{
			return _col;
		}
		
		/**
		 * Sets column number
		 */
		public function set col(value:int):void
		{
			//Sets local column variable value to value of parameter
			_col = value;
		}
		
		/**
		 * Creates a tile with specific color
		 * @param	color	Color of the tile
		 * @return	Returns a tile that is Image in type
		 */
		private function createTile(color:uint):Image
		{
			//Creates variable for a new shape
			var s:Shape = new Shape();
			
			//Sets line style of the shape
			s.graphics.lineStyle(1, 0x000000);
			
			//Sets color of the shape
			s.graphics.beginFill(color, .2);
			
			//Creates rectangle shape
			s.graphics.drawRect(0, 0, 90, 90);
			
			//Ends fill of shape
			s.graphics.endFill();

			//Creates variable for bitmap data
			var bmd:BitmapData = new BitmapData(s.width, s.height);
			
			//Draws shape to bitmap data
			bmd.draw(s);
			
			//Creates variable for Image and assigns bitmap data as new Image
			var image:Image = new Image(Texture.fromBitmapData(bmd));
			
			//Sets image rotation
			image.rotation = 40.1;
			
			//Sets transparency of image
			image.alpha = 0;
			
			return image;
		}
		
		/**
		 * Changes color of the tile
		 * @param	color	Color of the tile
		 */
		public function highlight(color:uint):void
		{
			//Checks tile
			if (_tile)
				
				//Checks if the stage contains tile
				if (this.contains(_tile))
				
					//Removes tile if is already existing
					this.removeChild(_tile);
			
			//Creates a new tile
			_tile = createTile(color);
			
			//Adds tile to the stage
			this.addChild(_tile);
		}
				
		/* INTERFACE com.poddcorp.towerdef.pathfinding.INode */
		
		/**
		 * Gets F cost of Tile
		 */
		public function get f():Number
		{
			return _f;
		}
		
		/**
		 * Gets F cost of Tile
		 */
		public function get g():Number
		{
			return _g;
		}
		
		/**
		 * Gets H cost of Tile
		 */
		public function get h():Number
		{
			return _h;
		}
		
		/**
		 * Gets ParentNode of Tile
		 */
		public function get parentNode():INode
		{
			return _parentNode;
		}
		
		//Gets traversability
		public function get traversable():Boolean
		{
			return _traversable;
		}
		
		/**
		 * Sets value of F cost
		 */
		public function set f(value:Number):void
		{
			//Sets local f to the value of parameter
			_f = value;
		}
		
		/**
		 * Sets value of G cost
		 */
		public function set g(value:Number):void
		{
			//Sets local g to the value of parameter
			_g = value;
		}
		
		/**
		 * Sets value of H cost
		 */
		public function set h(value:Number):void
		{
			//Sets local h to the value of parameter
			_h = value;
		}
		
		/**
		 * Sets value of parentNode
		 */
		public function set parentNode(value:INode):void
		{
			//Sets local parentnode to the value of parameter
			_parentNode = value;
		}
		
		/**
		 * Sets traversability
		 */
		public function set traversable(value:Boolean):void
		{
			//Sets local traversable to the value of parameter
			_traversable = value;
		}
	
	}

}