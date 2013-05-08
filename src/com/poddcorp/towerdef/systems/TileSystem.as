package com.poddcorp.towerdef.systems 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class TileSystem extends Sprite
	{
		private var _XMLLoader:URLLoader = new URLLoader();
		public var mapWidth:int, mapHeight:int;
		public var mapTerrain:String;
		public var mapTerrainData:Array;
		public var mapXML:XML;
		
		public function TileSystem() 
		{
			_XMLLoader.load(new URLRequest('map1.xml'));
			_XMLLoader.addEventListener(Event.COMPLETE, onXMLRead);
		}
		
		private function onXMLRead(e:Event):void 
		{
			mapXML = new XML(e.target.data);
			mapWidth = int(mapXML.width);
			mapHeight = int(mapXML.height);
			
			mapTerrain = mapXML.terrain;
			mapTerrain = mapTerrain.split("\t").join("\n");
			
			//Col load: mapColData:Array = mapTerrain[col + 1].split(',');
			trace(mapTerrain);
		}
		
	}

}