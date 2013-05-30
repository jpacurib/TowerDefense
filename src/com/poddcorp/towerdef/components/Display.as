package com.poddcorp.towerdef.components 
{
	import starling.display.DisplayObject;
	/**
	 * Display Class will set specific displayObject for each created entity.
	 * 
	 */
	public class Display 
	{
		//Creates a DisplayObject variable with null initial value.
		public var displayObject:DisplayObject = null;
		
		/**
		 * Accepts and sets display object for specific entity created.
		 * @param	displayObject	Display object that will be displayed for each entity.
		 */
		public function Display(displayObject:DisplayObject) 
		{
			//Sets value of local displayObject variable to value of parameter.
			this.displayObject = displayObject;
		}
		
	}

}