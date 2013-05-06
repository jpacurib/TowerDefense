package  
com.poddcorp.towerdef{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class UIAssets 
	{
		[Embed(source="../../../../assets/blue.PNG")]
		public static const btnBlue:Class;
		
		[Embed(source="../../../../assets/brown.PNG")]
		public static const btnBrown:Class;
		
		[Embed(source="../../../../assets/green.PNG")]
		public static const btnGreen:Class;
		
		[Embed(source="../../../../assets/orange.PNG")]
		public static const btnOrange:Class;
		
		[Embed(source="../../../../assets/red.PNG")]
		public static const btnRed:Class;
		
		[Embed(source="../../../../assets/yellow.PNG")]
		public static const btnYellow:Class;
		
		[Embed(source="../../../../assets/dok.PNG")]
		public static const dok:Class;
		
		[Embed(source="../../../../assets/pause.PNG")]
		public static const pause:Class;
		
		public static var UITextures:Dictionary = new Dictionary();
		
		public static function getUITexture(myString:String):Texture
		{
			if (UITextures[myString] == undefined)
			{
				var btmp:Bitmap = new UIAssets[myString]();
				UITextures[myString] = Texture.fromBitmap(btmp);
			}
			return UITextures[myString];
		}
		
	}

}