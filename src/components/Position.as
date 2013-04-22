package components 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Position 
	{
		private var position:Point;
		private var rotation:Number;
		
		public function Position(x:Number, y:Number, rotation:Number) 
		{
			position = new Point(x, y);
			this.rotation = rotation;
		}
		
	}

}