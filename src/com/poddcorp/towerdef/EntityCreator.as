package com.poddcorp.towerdef
{
	import ash.core.Engine;
	import ash.core.Entity;
	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.components.Collision;
	import com.poddcorp.towerdef.components.Display;
	import com.poddcorp.towerdef.components.Gun;
	import com.poddcorp.towerdef.components.Monster;
	import com.poddcorp.towerdef.components.Motion;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.components.Tile;
	import com.poddcorp.towerdef.components.TileDisplay;
	import com.poddcorp.towerdef.components.Tower;
	import com.poddcorp.towerdef.graphics.BulletView;
	import com.poddcorp.towerdef.graphics.MonsterOrcView;
	import com.poddcorp.towerdef.graphics.MonsterView;
	import com.poddcorp.towerdef.components.GameState;
	import com.poddcorp.towerdef.graphics.MonsterVoodooView;
	import com.poddcorp.towerdef.graphics.TowerView;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import flash.geom.Point;
	
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
		
		public function createSkullMonster(currentTile:IsoTile):Entity
		{
			var monster:Entity = new Entity()
				.add(new Monster())
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				.add(new Position(startTile.x - 72, startTile.y - 72, "")) //Added values for trial image
				.add(new Collision(startTile.width / 2))
				.add(new Motion(0, 0))
				.add(new TileDisplay(new MonsterView()));
			
			engine.addEntity(monster);
			return monster;
		}
		
		public function createVoodooMonster(currentTile:IsoTile):Entity
		{
			var monster:Entity = new Entity()
				.add(new Monster())
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				.add(new Position(startTile.x - 72, startTile.y - 72, "")) //Added values for trial image
				.add(new Collision(startTile.width / 2))
				.add(new Motion(0, 0))
				.add(new TileDisplay(new MonsterVoodooView()));
			
			engine.addEntity(monster);
			return monster;
		}
		
		public function createOrcMonster(currentTile:IsoTile):Entity
		{
			var monster:Entity = new Entity()
				.add(new Monster())
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				.add(new Position(startTile.x - 72, startTile.y - 72, "")) //Added values for trial image
				.add(new Collision(startTile.width / 2))
				.add(new Motion(0, 0))
				.add(new TileDisplay(new MonsterOrcView()));
			
			engine.addEntity(monster);
			return monster;
		}
		
		public function createTower(pt:Point):Entity
		{
			var tower:Entity = new Entity()
				.add(new Tower())
				.add(new Position(pt.x, pt.y, ""))
				.add(new Gun(pt, 2, .5))
				.add(new Display(new TowerView()));
			
			engine.addEntity(tower);
			return tower;
		}
	
		public function createBullet(gun:Gun, parentPosition:Position):Entity
	    {
		   var bullet : Entity = new Entity()
			   .add(new Bullet(gun.bulletLifeTime))
			   .add(new Position(parentPosition.position.x + 50, parentPosition.position.y + 25, ""))
			   .add(new Collision(32))
			   .add(new Motion(0, 0))
			   .add(new TileDisplay(new BulletView()));
	
		   engine.addEntity(bullet);
		   return bullet;
	
	    }

	}

}