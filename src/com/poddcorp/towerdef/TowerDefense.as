package com.poddcorp.towerdef {
	import com.poddcorp.towerdef.systems.GameSystem;
	import ash.core.Engine;
	import ash.integration.starling.StarlingFrameTickProvider;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;

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
		private var _tickProvider:StarlingFrameTickProvider;
		private var _injector:Injector;
		
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
			
			_injector.map(Engine).toValue(_engine);
			_injector.map(DisplayObjectContainer).toValue(this);
			_injector.map(GameConfig).asSingleton();
			_injector.map(EntityCreator).asSingleton();
			
			var config:GameConfig = _injector.getInstance(GameConfig);
			config.height = height;
			config.width = width;
			
			_engine.addSystem(new GameSystem(), SystemPriorities.preUpdate);
			//_engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
			//_engine.addSystem(new RenderSystem(), SystemPriorities.render);
			
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