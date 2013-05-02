package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class UIAssets 
	{
		[Embed(source = "../assets/blue.png")]
		public static const btnBlue:Class;
		
		[Embed(source = "../assets/brown.png")]
		public static const btnBrown:Class;
		
		[Embed(source = "../assets/green.png")]
		public static const btnGreen:Class;
		
		[Embed(source = "../assets/orange.png")]
		public static const btnOrange:Class;
		
		[Embed(source = "../assets/red.png")]
		public static const btnRed:Class;
		
		[Embed(source = "../assets/yellow.png")]
		public static const btnYellow:Class;
		
		[Embed(source = "../assets/dok.png")]
		public static const dok:Class;
		
		[Embed(source = "../assets/pause.png")]
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