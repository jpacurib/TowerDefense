package com.poddcorp.towerdef {
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import com.poddcorp.towerdef.systems.AnimationSystem;
	import com.poddcorp.towerdef.systems.GameSystem;
	import ash.core.Engine;
	import ash.integration.starling.StarlingFrameTickProvider;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import com.poddcorp.towerdef.systems.MovementSystem;
	import com.poddcorp.towerdef.systems.TileTraversalSystem;
	import flash.display.Stage;

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
		private var _map:IsoMap;
		private var _inode:INode;
		
		public function TowerDefense():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event:Event) : void {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			prepare();
			start();
		}
		
		private function prepare():void 
		{
			_injector = new Injector();
			_engine = new SwiftSuspendersEngine(_injector);
			_touchPoll = new TouchPoll(this);
			
			_map = new IsoMap(15, 15);
			_map.drawMap();
			addChild(_map);
			
			var startTile:IsoTile = _map.getTile(14, 0);
			var endTile:IsoTile = _map.getTile(0, 14);
			
			startTile.highlight(0xFF0000);
			endTile.highlight(0x00FF00);
			
			Pathfinder.heuristic = Pathfinder.euclidianHeuristic;
			//_map.drawPath(Pathfinder.findPath(startTile, endTile, _map.findConnectedNodes));
			
			_injector.map(Engine).toValue(_engine);
			_injector.map(DisplayObjectContainer).toValue(_map.tileHolder);
			_injector.map(GameConfig).asSingleton();
			_injector.map(EntityCreator).asSingleton();
			_injector.map(TouchPoll).toValue(_touchPoll);
			_injector.map(IsoMap).toValue(_map);
			_injector.map(INode).toValue(_inode);
			_injector.map(IsoTile, "start").toValue(startTile);
			_injector.map(IsoTile, "end").toValue(endTile);
			
			var config:GameConfig = _injector.getInstance(GameConfig);
			var stage:Stage = Starling.current.nativeStage;
			config.height = stage.stageHeight;
			config.width = stage.stageWidth;
			
			_map.x = (stage.stageWidth >> 1) + 25;
			_map.y = stage.stageHeight - _map.height >> 1;
			//_map.x = (stage.stageWidth * .5);

			_engine.addSystem(new GameSystem(), SystemPriorities.preUpdate);
			_engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
			_engine.addSystem(new MovementSystem(), SystemPriorities.move);
			//_engine.addSystem(new TileSystem(), SystemPriorities.preUpdate);
			_engine.addSystem(new TileTraversalSystem(), SystemPriorities.prerender);
			_engine.addSystem(new RenderSystem(), SystemPriorities.render);
			
			
			var creator:EntityCreator = _injector.getInstance(EntityCreator);
			creator.createGame();
			
		}
		
		public function start():void
		{
			_tickProvider = new StarlingFrameTickProvider(Starling.current.juggler);
			_tickProvider.add(_engine.update);
			_tickProvider.start();
		}

	}

}