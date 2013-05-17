package com.poddcorp.towerdef.pathfinding 
{	
	public interface INode 
	{
	
		function get f():Number;
		function get g():Number;
		function get h():Number;
		
		function get row():int;
		function set row(value:int):void;
		
		function get col():int;
		function set col(value:int):void;
		
		function get x():Number;
		function set x(value:Number):void;
		
		function get y():Number;
		function set y(value:Number):void;
		
		
		function get parentNode():INode;
		function set parentNode(value:INode):void;
		
		function set traversable(value:Boolean):void;
		function get traversable():Boolean;		
				
		function set f(value:Number):void;
		function set g(value:Number):void;
		function set h(value:Number):void;
		
	}
	
}