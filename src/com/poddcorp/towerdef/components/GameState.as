package com.poddcorp.towerdef.components 
{
	/**
	 * GameState stores data of the game
	 * 
	 */
	public class GameState 
	{
		//Declare global variable for lives
		public var lives:int;
				
		//Declare global variable for waves
		public var wave:int;
		
		//Declare global variable for monster per wave
		public var monperwave:int;
		
		public var gold:int;
		
		public var totalMonster:int;
		
		/**
		 * Gives specific value to global variable for state of game.
		 */
		public function GameState()
		{
			lives = 5;
			wave = 10;
			monperwave = 1;
			gold = 50;
			
			totalMonster = 0;
		}
	}

}