package com.poddcorp.towerdef
{
	import feathers.text.BitmapFontTextFormat;
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	import flash.utils.Dictionary;
	
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class UIAssets
	{
		
		[Embed(source = "../../../../assets/img_arrow1.png")]
		public static const arrow:Class;
		
		[Embed(source="../../../../assets/sounds/12.mp3")]
		public var _Btnclick:Class;
		
		[Embed(source="../../../../assets/sounds/frozenheart.mp3")]
		public var _BGMySound:Class;
		//assets for new game
		//	[Embed(source="../../../../assets/newGame.png")]
		//	public static const NewGame:Class;
		//---------------------------------------------
		
		[Embed(source="../../../../assets/background.png")]
		public static const SETTINGS:Class;
		
		[Embed(source="../../../../assets/menu title.PNG")]
		public static const TitleMenu:Class;
		
		[Embed(source="../../../../assets/MainMenuBG.png")]
		public static const bgimge:Class;
		
		[Embed(source="../../../../assets/fontsGame/ModerneFraktur.ttf",fontFamily="MyFont",embedAsCFF="false")]
		public static var GameFont:Class;
		
		
		
		[Embed(source="../../../../assets/fontsGame/TrajanPro-Bold.otf",fontFamily="MyFont1",embedAsCFF="false")]
		public static var GameFont1:Class;
		
		
	
		
		//=====================================================================
		//spritesheets
		public static var UITextureAtlas:TextureAtlas;
		[Embed(source="../../../../assets/Game_SpriteSheets.png")]
		public static const AtlasTextureUI:Class;
		
		[Embed(source="../../../../assets/Game_SpriteSheets.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlUI:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if (UITextureAtlas == null)
			{
				var texture:Texture = getUITexture("AtlasTextureUI");
				var xml:XML = XML(new AtlasXmlUI());
				UITextureAtlas = new TextureAtlas(texture, xml);
			}
			return UITextureAtlas;
		}
		
		public static var AtlasSkull:TextureAtlas;
		
		[Embed(source="../../../../assets/skull.png")]
		public static const AtlasTextureSkull:Class;
		
		[Embed(source="../../../../assets/skull.xml",mimeType="application/octet-stream")]
		public static const AtlasXMLSkull:Class;
		
		public static function getSkullAtlas():TextureAtlas
		{
			if (AtlasSkull == null)
			{
				var texture:Texture = getUITexture("AtlasTextureSkull");
				var xml:XML = XML(new AtlasXMLSkull());
				AtlasSkull = new TextureAtlas(texture, xml);
			}
			return AtlasSkull;
		}
		
		
		[Embed(source="../../../../assets/tower.png")]
		public static const AtlasTextureTower:Class;
		
		[Embed(source="../../../../assets/tower.xml",mimeType="application/octet-stream")]
		public static const AtlasXMLTower:Class;
		
		public static var AtlasTower:TextureAtlas;
		
		public static function getAtlasTower():TextureAtlas
		{
			if (AtlasTower == null)
			{
				var texture:Texture = getUITexture("AtlasTextureTower");
				var xml:XML = XML(new AtlasXMLTower());
				AtlasTower = new TextureAtlas(texture, xml);
			}
			return AtlasTower;
		}
		
		//=====================================================================
		// Font
		
		
		[Embed(source="../../../../assets/fontsGame/MedevialFont.fnt",mimeType="application/octet-stream")]
		public static var FontXml:Class;
		
		[Embed(source="../../../../assets/fontsGame/MedevialFont_0.png")]
		public static var FontTexture:Class;
		

		public static var myGamefont:BitmapFont;
		
		public static function getFont():BitmapFont
		{
			var fontTxtre:Texture = Texture.fromBitmap(new FontTexture());
			var fontXml:XML = XML(new FontXml());
			
			myGamefont = new BitmapFont(fontTxtre, fontXml);
			TextField.registerBitmapFont(myGamefont);
			return myGamefont;
		}
		
		//================================================================
		// 
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