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
		
		//Declare global variable for gold
		public var gold:int;
		
		//Declare global variable for total monster
		public var totalMonster:int;
		
		/**
		 * Gives specific value to global variable for state of game.
		 */
		public function GameState()
		{
			lives = 10;
			wave = 10;
			monperwave = 50;
			gold = 50;
			totalMonster = 0;
		}
	}

}