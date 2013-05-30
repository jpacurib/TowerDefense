package com.poddcorp.towerdef
{
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import com.poddcorp.towerdef.systems.AnimationSystem;
	import com.poddcorp.towerdef.systems.BulletAgeSystem;
	import com.poddcorp.towerdef.systems.BulletSystem;
	import com.poddcorp.towerdef.systems.CollisionSystem;
	import com.poddcorp.towerdef.systems.GameSystem;
	import ash.core.Engine;
	import ash.integration.starling.StarlingFrameTickProvider;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import com.poddcorp.towerdef.systems.GunControlSystem;
	import com.poddcorp.towerdef.systems.MovementSystem;
	import com.poddcorp.towerdef.systems.TileRenderSystem;
	import com.poddcorp.towerdef.systems.TileTraversalSystem;
	import com.poddcorp.towerdef.UI.TowerButton;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.text.TextField;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import com.poddcorp.towerdef.systems.RenderSystem;
	import com.poddcorp.towerdef.systems.SystemPriorities;
	
	import org.swiftsuspenders.Injector;
	
	//import flash.display.Sprite;
	
	public class TowerDefense extends Sprite
	{
		private var _engine:Engine;
		public var _tickProvider:StarlingFrameTickProvider;
		private var _injector:Injector;
		private var _touchPoll:TouchPoll;
		public var _map:IsoMap;
		private var _inode:INode;
		
		private var _grassmap:Image;
		private var _towerHolder:Image;
		private var _hudVertical:Image;
		
		//Texts
		public var _village:TextField;
		//public var _life:TextField;
				
		//FOR TOWER
		private var _towerButton:TowerButton;
		
		public function TowerDefense():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			_grassmap = new Image(UIAssets.getUITexture("plainMap"));
		}
		
		private function onEnterFrame(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			prepare();
			start();
			
			//creates UI
			createUI();
		}
		
		public function updateUI():void
		{
			var viewPort:Rectangle = Starling.current.viewPort;
			_hudVertical.x = viewPort.width - _hudVertical.width;
			_hudVertical.y = 10;
			
			_towerButton.x = viewPort.width - 150;
			_towerButton.y = viewPort.height - 200;
			
			_towerHolder.x = viewPort.width - 160;
			_towerHolder.y = viewPort.height - 210;
			
			
			_village.text = "Orto Village";
			_village.x = _hudVertical.x;
			_village.y = 10;
			
			trace(viewPort);
		}
		
		private function prepare():void
		{
			_injector = new Injector();
			_engine = new SwiftSuspendersEngine(_injector);
			_touchPoll = new TouchPoll(this);
			
			addChild(_grassmap);
			
			_map = new IsoMap(12, 12);
			
			_map.drawMap();
			addChild(_map);
			
			var startTile:IsoTile = _map.getTile(11, 0);
			var endTile:IsoTile = _map.getTile(0, 11);
			
			_map._startTile = startTile;
			_map._endTile = endTile;
			
			startTile.highlight(0xFF0000);
			endTile.highlight(0x00FF00);
			
			Pathfinder.heuristic = Pathfinder.euclidianHeuristic;
			
			_injector.map(Engine).toValue(_engine);
			_injector.map(DisplayObjectContainer).toValue(_map.tileHolder);
			_injector.map(GameConfig).asSingleton();
			_injector.map(EntityCreator).asSingleton();
			_injector.map(TouchPoll).toValue(_touchPoll);
			_injector.map(IsoMap).toValue(_map);
			_injector.map(INode).toValue(_inode);
			_injector.map(IsoTile, "start").toValue(startTile);
			_injector.map(IsoTile, "end").toValue(endTile);
			
			_injector.map(TowerButton).toValue(_towerButton);
			
			var config:GameConfig = _injector.getInstance(GameConfig);
			var stage:Stage = Starling.current.nativeStage;
			
			config.height = stage.stageHeight;
			config.width = stage.stageWidth;
			
			_map.x = (stage.stageWidth >> 1) + (startTile.width / 2);
			_map.y = (stage.stageHeight - _map.height >> 1) + (startTile.height);
			
			_engine.addSystem(new GameSystem(), SystemPriorities.preUpdate);
			_engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
			
			_engine.addSystem(new MovementSystem(), SystemPriorities.move);
			
			_engine.addSystem(new TileTraversalSystem(), SystemPriorities.prerender);
			_engine.addSystem(new TileRenderSystem(), SystemPriorities.prerender);
			_engine.addSystem(new GunControlSystem(), SystemPriorities.move);
			
			_engine.addSystem(new CollisionSystem(), SystemPriorities.update);
			
			_engine.addSystem(new BulletAgeSystem(), SystemPriorities.update);
			
			//_engine.addSystem(new BulletSystem(), SystemPriorities.prerender);
			_engine.addSystem(new RenderSystem(), SystemPriorities.render);
			
			var creator:EntityCreator = _injector.getInstance(EntityCreator);
			creator.createGame();
			
			_touchPoll.creator = creator;
		}
		
		//FOR TOWER
		private function createUI():void
		{
			_towerButton = new TowerButton();
			_towerHolder = new Image(UIAssets.getAtlas().getTexture("hud_towerholder"));
			_hudVertical = new Image(UIAssets.getAtlas().getTexture("hud_game"));
			_village = new TextField(_hudVertical.width, _hudVertical.height, "", "MyFont1", 20, 0xFFFFFF); 
			//_life = new TextField(_hudVertical.width, _hudVertical.height, "", "MyFont1", 20, 0xFFFFFF); 
			
			addChild(_hudVertical);
			addChild(_towerHolder);
			addChild(_towerButton);

			addChild(_village);
			
			updateUI();
			
			
		}
		
		public function start():void
		{
			_tickProvider = new StarlingFrameTickProvider(Starling.current.juggler);
			_tickProvider.add(_engine.update);
			_tickProvider.start();
		}
	
	}

}