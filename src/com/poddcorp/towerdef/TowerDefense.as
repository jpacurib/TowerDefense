package
com.poddcorp.towerdef{
	
	import ash.core.Engine;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import ash.tick.FrameTickProvider;

	import com.poddcorp.towerdef.systems.BulletAgeSystem;
	import com.poddcorp.towerdef.systems.CollisionSystem;
	import com.poddcorp.towerdef.systems.GameManager;
	import com.poddcorp.towerdef.systems.GoldSystem;
	import com.poddcorp.towerdef.systems.MonsterDeathSystem;
	import com.poddcorp.towerdef.systems.MonsterMovementSystem;
	import com.poddcorp.towerdef.systems.RenderSystem;
	import com.poddcorp.towerdef.systems.SystemPriorities;
	import com.poddcorp.towerdef.systems.TileSystem;

	import org.swiftsuspenders.Injector;

	import flash.display.DisplayObjectContainer;
	//import flash.display.Sprite;
	
	
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
		
		private function prepare(width:Number, height:Number):void
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