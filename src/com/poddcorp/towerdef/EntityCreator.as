package com.poddcorp.towerdef
{
	import ash.core.Engine;
	import ash.core.Entity;
	import com.poddcorp.towerdef.components.Bullet;
	import com.poddcorp.towerdef.components.Coin;
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
	 * Entity Creator creates entity to the engine and destroys entity from the engine.
	 * 
	 */
	public class EntityCreator
	{
		//Request instance for start tile
		[Inject(name="start")]
		public var startTile:IsoTile;
		
		//Request instance for end tile
		[Inject(name="end")]
		public var endTile:IsoTile;
		
		//Request instance for map
		[Inject]
		public var map:IsoMap;
		
		//Declares a variable engine in ASH
		private var engine:Engine;
		
		/**
		 * Entity Creator
		 * @param	engine	Engine that will be used.
		 */
		public function EntityCreator(engine:Engine)
		{
			//Declares local engine to value of parameter.
			this.engine = engine;
		}
		
		/**
		 * Creates game entities
		 * @return	Returns all game entities
		 */
		public function createGame():Entity
		{
			//Creates variable for entity
			var gameEntity:Entity = new Entity()
			
				//Adds GameState component to GameEntity
				.add(new GameState());
				
			//Adds gameEntity to Engine
			engine.addEntity(gameEntity);
			

			return gameEntity;
		}
		
		/**
		 * Removes entity from the engine
		 * @param	entity	Entity to be removed
		 */
		public function destroyEntity(entity:Entity):void
		{
			//Removes entity from engine
			engine.removeEntity(entity);
		}
		
		/**
		 * Creates a skull monster to the engine
		 * @param	currentTile	Tile where the monster will spawn.
		 * @return	Returns skull monster entity
		 */
		public function createSkullMonster(currentTile:IsoTile):Entity
		{
			//Creates a variable for monster entity
			var monster:Entity = new Entity()
				
				//Adds Monster Component to Monster Entity
				.add(new Monster(4))
				
				//Adds Tile Component to Monster Entity
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				
				//Adds Position Component to Monster Entity
				.add(new Position(startTile.x - 72, startTile.y - 72, "")) 
				
				//Adds Collision Component to Monster Entity
				.add(new Collision(startTile.width / 2))
				
				//Adds Motion Component to Monster Entity
				.add(new Motion(0, 0))
				
				//Adds Display Component MonsterView to Monster Entity
				.add(new TileDisplay(new MonsterView()));
			
			//Adds monster entity to the Engine
			engine.addEntity(monster);
			return monster;
		}
		
		/**
		 * Creates a voodoo monster to the engine
		 * @param	currentTile	Tile where the monster will spawn.
		 * @return	Returns voodoo monster entity
		 */
		public function createVoodooMonster(currentTile:IsoTile):Entity
		{
			//Creates a variable for monster entity
			var monster:Entity = new Entity()
			
				//Adds Monster Component to Monster Entity
				.add(new Monster(1))
				
				//Adds Tile Component to Monster Entity
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				
				//Adds Position Component to Monster Entity	
				.add(new Position(startTile.x - 72, startTile.y - 50, "")) 
				
				//Adds Collision Component to Monster Entity
				.add(new Collision(startTile.width / 2))
				
				//Adds Motion Component to Monster Entity
				.add(new Motion(0, 0))
				
				//Adds Display Component MonsterView to Monster Entity
				.add(new TileDisplay(new MonsterVoodooView()));
			
			//Adds monster entity to the Engine
			engine.addEntity(monster);
			return monster;
		}
		
		/**
		 * Creates a Orc monster to the engine
		 * @param	currentTile	Tile where the monster will spawn.
		 * @return	Returns orc monster entity
		 */
		public function createOrcMonster(currentTile:IsoTile):Entity
		{
			//Creates a variable for monster entity
			var monster:Entity = new Entity()
			
				//Adds Monster Component to Monster Entity
				.add(new Monster(3))
				
				//Adds Tile Component to Monster Entity	
				.add(new Tile(currentTile, Pathfinder.findPath(startTile, endTile, map.findConnectedNodes)))
				
				//Adds Position Component to Monster Entity
				.add(new Position(startTile.x - 72, startTile.y - 50, "")) 
				
				//Adds Collision Component to Monster Entity
				.add(new Collision(startTile.width / 2))
				
				//Adds Motion Component to Monster Entity
				.add(new Motion(0, 0))
				
				//Adds Display Component MonsterView to Monster Entity
				.add(new TileDisplay(new MonsterOrcView()));
			
			//Adds monster entity to the Engine
			engine.addEntity(monster);
			return monster;
		}
		
		/**
		 * Creates tower at a certain point on the map
		 * @param	pt	Position of the tower
		 * @return Returns tower entity
		 */
		public function createTower(pt:Point):Entity
		{
			//Creates a variable for Tower entity
			var tower:Entity = new Entity()
			
				//Adds Tower Component to Tower Entity
				.add(new Tower())
				
				//Adds Position Component to Tower Entity
				.add(new Position(pt.x, pt.y, ""))
				
				//Adds Gun Component to Tower Entity
				.add(new Gun(pt, 2, 1))
				
				//Adds Display Component to Tower Entity
				.add(new Display(new TowerView()));
			
			//Adds Tower Entity to Engine
			engine.addEntity(tower);
			return tower;
		}
		
		/**
		 * Creates bullet for each Gun in Tower
		 * @param	gun	Gun properties
		 * @param	parentPosition	Position where the bullet will be created
		 * @return	Returns a bullet entity
		 */
		public function createBullet(gun:Gun, parentPosition:Position):Entity
	    {
			//Creates a variable for Bullet Entity
			var bullet : Entity = new Entity()
				
				//Adds Bullet Component to Bullet Entity
			   .add(new Bullet(gun.bulletLifeTime))
			   
			   //Adds Position Component to Bullet Entity
			   .add(new Position(parentPosition.position.x + 50, parentPosition.position.y + 25, ""))
			   
			   //Adds Collision Component to Bullet Entity
			   .add(new Collision(32))
			   
			   //Adds Motion Component to Bullet Entity
			   .add(new Motion(0, 0))
			   
			   //Adds Display Component BulletView to Bullet Entity
			   .add(new TileDisplay(new BulletView()));
			
			//Adds Bullet Entity to Engine
			engine.addEntity(bullet);
			return bullet;
	
	    }

	}

}