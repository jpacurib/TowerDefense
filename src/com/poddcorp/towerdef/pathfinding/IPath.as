package com.poddcorp.towerdef.pathfinding 
{
	import ash.core.Entity;
	import ash.core.System;
	import com.poddcorp.towerdef.EntityCreator;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class IPath extends System implements INode
	{
		[Inject]
		public var creator:EntityCreator;
		
		private var _parentNode:INode;		
		private var _f:Number;
		private var _g:Number;
		private var _h:Number;
		private var _traversable:Boolean = true;
		
		private var _row:int;
		private var _col:int;
		
		public function IPath(row:int, col:int, rowX:Number, rowY:Number) 
		{
			this.row = row;
			this.col = col;
			this.createMyTile(rowX, rowY);
		}
		
		public function createMyTile(rowX:Number, rowY:Number):void 
		{
			creator.createTile(rowX, rowY);
		}
		
		public function get parentNode():INode { return _parentNode; }		
		public function set parentNode(value:INode):void { _parentNode = value; }
		
		public function get f():Number { return _f; }		
		public function set f(value:Number):void { _f = value; }
		
		public function get g():Number { return _g; }		
		public function set g(value:Number):void { _g = value; }
		
		public function get h():Number { return _h; }		
		public function set h(value:Number):void { _h = value; }
		
		public function get traversable():Boolean { return _traversable; }		
		public function set traversable(value:Boolean):void { _traversable = value; }
		
		public function get row():int { return _row; }		
		public function set row(value:int):void { _row = value;	}
		
		public function get col():int { return _col; }		
		public function set col(value:int):void { _col = value; }
	}

}