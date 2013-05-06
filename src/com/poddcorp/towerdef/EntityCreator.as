package com.poddcorp.towerdef 
{
	import ash.core.Engine;
	import ash.core.Entity;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.graphics.MonsterView;
	
	import com.poddcorp.towerdef.components.GameState;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class EntityCreator 
	{
		private var engine:Engine;
		
		public function EntityCreator(engine:Engine) 
		{
			this.engine = engine;
		}
		
		public function createGame():Entity
		{
			var gameEntity:Entity = new Entity()
				.add(new GameState());
			engine.addEntity(gameEntity);
			return gameEntity;
		}
		
		public function destroyEntity(entity:Entity):void
		{
			engine.removeEntity(entity);
		}
		
		public function createMonster(x:Number, y:Number, radius:Number):Entity
		{
			var monster:Entity = new Entity()
				.add(new Monster())
				.add(new Position(x, y, 0))
				.add(new Display(new MonsterView(radius)));
				
			engine.addEntity(monster);
			return monster;
		}
	}

}