package com.poddcorp.towerdef {
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.systems.AnimationSystem;
	import com.poddcorp.towerdef.systems.GameSystem;
	import ash.core.Engine;
	import ash.integration.starling.StarlingFrameTickProvider;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import com.poddcorp.towerdef.systems.MonsterMovementSystem;
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
			
			_injector.map(Engine).toValue(_engine);
			_injector.map(DisplayObjectContainer).toValue(this);
			_injector.map(GameConfig).asSingleton();
			_injector.map(EntityCreator).asSingleton();
			_injector.map(TouchPoll).toValue(_touchPoll);
			_injector.map(IsoMap).toValue(_map);
			_injector.map(INode).toValue(_inode);
			
			var config:GameConfig = _injector.getInstance(GameConfig);
			var stage:Stage = Starling.current.nativeStage;
			config.height = stage.stageHeight;
			config.width = stage.stageWidth;
			
			_map.x = stage.stageWidth >> 1;
			_map.y = stage.stageHeight - _map.height >> 1;
			
			_engine.addSystem(new GameSystem(), SystemPriorities.preUpdate);
			_engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
			//_engine.addSystem(new MonsterMovementSystem(), SystemPriorities.move);
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