package com.poddcorp.towerdef
{
	import feathers.text.BitmapFontTextFormat;
	import flash.display.Bitmap;
	import flash.media.Sound;
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
		
		//============MonsterSounds==========================
		
		[Embed(source="../../../../assets/sounds/Monster.mp3")]
		public static var FirstMonster:Class;
		[Embed(source="../../../../assets/sounds/Monster2.mp3")]
		public static var SecondMonster:Class;
		[Embed(source="../../../../assets/sounds/Monster3.mp3")]
		public static var ThirdMonster:Class;
		[Embed(source="../../../../assets/sounds/DieMonster.mp3")]
		public static var DieFirstMonster:Class;
		[Embed(source="../../../../assets/sounds/DieMonster2.mp3")]
		public static var DieSecondMonster:Class;
		[Embed(source="../../../../assets/sounds/DieMonster3.mp3")]
		public static var DieThirdMonster:Class;
		
		//=============Tower Sounds==============================
		
		[Embed(source="../../../../assets/sounds/NormalTowerArrow.mp3")]
		public static var NormalTower:Class;
		[Embed(source="../../../../assets/sounds/FireTowerShots.mp3")]
		public static var FIRETower:Class;
		/*[Embed(source="../../../../assets/sounds/IceTowerShot.mp3")]
		public static var ICEtower:Class;*/
		[Embed(source="../../../../assets/sounds/LightningTowerShot.mp3")]
		public static var LIGHTtower:Class;
		
		//==================Buttons==and==Background===Sounds==============================
		
		[Embed(source="../../../../assets/sounds/12.mp3")]
		public var _Btnclick:Class;
		
		[Embed(source="../../../../assets/sounds/frozenheart.mp3")]
		public static var BGMySound:Class;
		
		[Embed(source="../../../../assets/sounds/05_EscapeFromTheTower.mp3")]
		public static var IngameSound:Class;
		
		public static function getSound(name:String):Sound
		{
			var snd:Sound = new UIAssets[name]() as Sound;
			return snd;
		}
		
		//---------------------------------------------
		
		[Embed(source="../../../../assets/plainmap.png")]
		public static const plainMap:Class;
		
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