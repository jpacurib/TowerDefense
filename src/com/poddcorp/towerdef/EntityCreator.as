package com.poddcorp.towerdef 
{
	import ash.core.Engine;
	import ash.core.Entity;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.components.Tower;
	import com.poddcorp.towerdef.graphics.MonsterView;
	import com.poddcorp.towerdef.components.GameState;
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
				.add(new Position(startTile.x, startTile.y, 0))
				.add(new Motion(0, 0))
				.add(new Display(new MonsterView()));
				
			engine.addEntity(monster);
			return monster;
		}
		
		/*public function createTile(x:Number, y:Number):Entity
		{
			var tile:Entity = new Entity()
				.add(new Tile())
				.add(new Position(x, y, 0))
				.add(new Display(new TileView));
			engine.addEntity(tile);
			return tile;
		}	*/
		
		/*public function createWall(x:Number, y:Number):Entity
		{
			var tile:Entity = new Entity()
				.add(new Tile())
				.add(new Position(x, y, 0))
				.add(new Display(new TestedTile));
				
			//engine.addEntity(tile);
			return tile;
		}*/
		
		/*public function createTower(x:Number, y:Number):Entity
		{
			var tower:Entity = new Entity()
				.add(new Tower())
				.add(new Position(x, y, 0))
				.add(new Display(new TowerView));
				
			engine.addEntity(tower);
			return tower;
		}*/

	}

}