package com.poddcorp.towerdef
{
	import ash.core.Node;
	import com.poddcorp.towerdef.components.Tile;
	import flash.geom.Point;
	import flash.display.Stage;
	//import com.poddcorp.towerdef.graphics.TileView;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class IsoMap extends Sprite
	{
		private var _tileHolder:Sprite
		private var _nodes:Array;
		
		private var _startTile:IsoTile;
		private var _endTile:IsoTile;
		private var rows:int;
		private var cols:int;
		private var _tiles:Vector.<IsoTile> = new Vector.<IsoTile>();
		
		public var _path:Array = new Array();
		
		public var rowX:Number, rowY:Number;
		private var counter:int = 0;
		
		public function IsoMap(rows:int, cols:int)
		{
			this.cols = cols;
			this.rows = rows;
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(this);
			for each (var touch:Touch in touches)
			{
				switch (touch.phase)
				{
					case TouchPhase.BEGAN: 
						for each (var tile:IsoTile in _tiles)
						{
							if (touch.isTouching(tile))
							{
								//Click Start and End Tile
								/*if (_startTile == null) {
								   _startTile = tile;
								   _startTile.highlight(0xFF0000);
								   break;
								   }
								
								   if (_startTile) {
								   if (_endTile == null) {
								   _endTile = tile;
								   _endTile.highlight(0x00FF00);
								   }
								   }
								
								   if (_startTile && _endTile) {
								   Pathfinder.heuristic = Pathfinder.euclidianHeuristic;
								   drawPath(Pathfinder.findPath(_startTile, _endTile, findConnectedNodes));
								 }*/
								//End of Start and Click Tile
								
								tile.highlight(0xCCCC00);
								tile.traversable = false;
								
							}
						}
						break;
					default: 
				}
			}
		}
		
		public function drawMap():void
		{
			_tileHolder = new Sprite();
			this.addChild(_tileHolder);
			
			for (var row:int = 0; row < rows; row++)
			{
				for (var col:int = 0; col < cols; col++)
				{
					var tile:IsoTile = new IsoTile(row, col);
					tile.x = (col - row) * tile.width / 2;
					tile.y = (row + col) * tile.height / 2;
					
					_tileHolder.addChild(tile);
					
					_tiles.push(tile);
				}
			}
		}
		
		public function drawPath(tiles:Array):void
		{
			for each (var tile:IsoTile in tiles)
			{
				tile.highlight(0x0000FF);
			}
		}
		
		public function findConnectedNodes(node:INode):Array
		{
			var n:IsoTile = node as IsoTile;
			var connectedNodes:Array = [];
			var testNode:IsoTile;
			for (var i:int = 0; i < _tiles.length; i++)
			{
				testNode = _tiles[i];
				if (testNode.row < n.row - 1 || testNode.row > n.row + 1)
					continue;
				if (testNode.col < n.col - 1 || testNode.col > n.col + 1)
					continue;
				
				connectedNodes.push(testNode);
			}
			
			return connectedNodes;
		}
		
		public function get endTile():IsoTile
		{
			return _endTile;
		}
		
		public function set endTile(value:IsoTile):void
		{
			_endTile = value;
		}
		
		public function get startTile():IsoTile
		{
			return _startTile;
		}
		
		public function set startTile(value:IsoTile):void
		{
			_startTile = value;
		}
		
		public function get tileHolder():Sprite
		{
			return _tileHolder;
		}
		
		//GETTING TILES
		public function getTile(row:int, col:int):IsoTile
		{
			
			for each (var node:IsoTile in _tiles)
			{
				if (node.row == row && node.col == col)
					return node;
			}
			return null;
		}
	}

}