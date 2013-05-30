package com.poddcorp.towerdef.components 
{
	import com.poddcorp.towerdef.graphics.Animatable;
	
	/**
	* Animation Class
	*/
	public class Animation 
	{
		//Creates animation variable in Animatable datatype
		public var animation:Animatable;
		
		/**
		* Accepts Animatable datatype and stores to local variable which is animation.
		* @param animation Animatable Parameter
		*/
		public function Animation(animation:Animatable) 
		{
			this.animation = animation;			
		}
		
	}

}