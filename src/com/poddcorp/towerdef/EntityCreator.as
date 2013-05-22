package com.poddcorp.towerdef 
{
	import ash.core.Engine;
	import ash.core.Entity;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.components.TileDisplay;
	import com.poddcorp.towerdef.components.Tower;
	import com.poddcorp.towerdef.graphics.MonsterView;
	import com.poddcorp.towerdef.components.GameState;
	import com.poddcorp.towerdef.graphics.TowerView;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	/**
	 * ...
	 * @author Jeremy
	 */
	public class EntityCreator 
	{
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		[Inject(name="end")]
		public var endTile:IsoTile;
		
		[Inject]
		public var map:IsoMap;
		
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
		
		public function createMonster(currentTile:IsoTile):Entity
		{
			var monster:Entity = new Entity()
				.add(new Monster())
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				.add(new Position(startTile.x, startTile.y, ""))
				.add(new Motion(0, 0))
				.add(new TileDisplay(new MonsterView()));
				
			engine.addEntity(monster);
			return monster;
		}
		
		public function createTower(posX:Number, posY:Number)
		{
			var tower:Entity = new Entity()
				.add(new Tower())
				.add(new Position(posX, posY, ""))
				.add(new TileDisplay(new TowerView()));
				
			engine.addEntity(tower);
			return tower;
			
		}
		
		
		
		

	}

}