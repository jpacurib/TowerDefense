package
com.poddcorp.towerdef{
	
	import ash.core.Engine;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import ash.tick.FrameTickProvider;
	
	import com.poddcorp.towerdef.systems.GameManager;
	import com.poddcorp.towerdef.systems.SystemPriorities;

	import org.swiftsuspenders.Injector;

	import flash.display.DisplayObjectContainer;
	//import flash.display.Sprite;
	
	
	public class TowerDefense
	{
		private var engine:Engine;
		private var tickProvider:FrameTickProvider;
		private var injector:Injector;
		private var container:DisplayObjectContainer;
		
		public function TowerDefense(container:DisplayObjectContainer, width:Number, height:Number):void
		{
			this.container = container;
			prepare(width, height);
		}
		
		private function prepare(width:Number, height:Number):void 
		{
			injector = new Injector();
			engine = new SwiftSuspendersEngine(injector);
			
			injector.map(Engine).toValue(engine);
			injector.map(DisplayObjectContainer).toValue(container);
			injector.map(GameConfig).asSingleton();
			injector.map(EntityCreator).asSingleton();
			
			var config:GameConfig = injector.getInstance(GameConfig);
			config.height = height;
			config.width = width;
			
			engine.addSystem(new GameManager(), SystemPriorities.preUpdate);
			
			var creator:EntityCreator = injector.getInstance(EntityCreator);
			creator.createGame();
		}
		
		public function start():void
		{
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	
	}

}