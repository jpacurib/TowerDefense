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
		[Embed(source="../../../../assets/yes.png")]
		public static const yes:Class;
		[Embed(source="../../../../assets/no.png")]
		public static const no:Class;
		[Embed(source = "../../../../assets/or.png")]
		public static const or:Class;
		
		[Embed(source = "../../../../assets/scroll.png")]
		public static const Scroll:Class;
	
		
		[Embed(source="../../../../assets/MainMenuBG.png")]
		public static const bgimge:Class;
		
	[Embed(source="../../../../assets/btnStart.png")]
		public static const btnBlue:Class;
	
		[Embed(source="../../../../assets/btnOptions.png")]
		public static const btnBrown:Class;
		
		[Embed(source="../../../../assets/btnQuit.png")]
		public static const btnGreen:Class;
		
		[Embed(source="../../../../assets/btnRsm.png")]
		public static const btnOrange:Class;
		
		[Embed(source="../../../../assets/btnBack.png")]
		public static const btnRed:Class;
		
		[Embed(source="../../../../assets/btnBM.png")]
		public static const btnYellow:Class;
		
		[Embed(source="../../../../assets/btnHelp.png")]
		public static const btnHelp:Class;
		
		
		
		[Embed(source = "../../../../assets/dok.PNG")]
		public static const dok:Class;
		
	[Embed(source="../../../../assets/ply.png")]
		public static const play:Class;
		
		[Embed(source = "../../../../assets/pause.PNG")]
		public static const pause:Class;
		
		//[Embed(source = "../../../../assets/play.png")]
	//	public static const play:Class;
		
		[Embed(source = "../../../../assets/vol.PNG")]
		public static const Vol:Class;
		
		[Embed(source = "../../../../assets/qlty.PNG")]
		public static const Qlty:Class;
		
		[Embed(source = "../../../../assets/tile.png")]
		public static const tile:Class;
		
		[Embed(source = "../../../../assets/lubi.png")]
		public static const lubi:Class;
		
		[Embed(source = "../../../../assets/podd.png")]
		public static const splash:Class;
		
		[Embed(source = "../../../../assets/wall.png")]
		public static const wall:Class;
		
		[Embed(source = "../../../../assets/tower.png")]
		public static const tower:Class;
		
	[Embed(source="../../../../assets/ModerneFraktur.ttf",fontFamily="MyFont",embedAsCFF="false")]	
		public static var GameFont:Class;
		
		
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