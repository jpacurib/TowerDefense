package com.poddcorp.towerdef.components 
{
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameState 
	{
		public var lives:int;
		public var level:int;
		public var points:int;
		public var wave:int;
		public var monperwave:int;
		
		public function GameState()
		{
			lives = 50;
			level = 0;
			points = 0;
			wave = 10;
			monperwave = 3;
		}
	}

}