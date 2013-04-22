package
{
	
	import ash.core.Engine;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import ash.integration.swiftsuspenders.NodeListProvider;
	import ash.tick.FrameTickProvider;
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
	
	}

}