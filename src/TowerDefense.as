package
{
	
	import ash.core.Engine;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import ash.tick.FrameTickProvider;
	
	import systems.BulletAgeSystem;
	import systems.CollisionSystem;
	import systems.GameManager;
	import systems.GoldSystem;
	import systems.MonsterDeathSystem;
	import systems.MonsterMovementSystem;
	import systems.RenderSystem;
	import systems.SystemPriorities;
	import systems.TileSystem;
	
	import flash.display.DisplayObjectContainer;
	
	import org.swiftsuspenders.Injector;
	
	public class TowerDefense
	{
		private var engine:Engine;
		private var tickProvider:FrameTickProvider;
		private var injector:Injector;
		private var container:DisplayObjectContainer;
		
		public function TowerDefense(container:DisplayObjectContainer, width:Number, height:Number)
		{
			this.container = container;
			prepare(width, height);
		}
		
		private function prepare(width:Number, height:Number)
		{
			injector = new Injector();
			engine = new SwiftSuspendersEngine(injector);
		
		}
		
		public function start():void 
		{
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	
	}

}