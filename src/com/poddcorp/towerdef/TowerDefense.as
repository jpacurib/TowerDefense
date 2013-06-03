package com.poddcorp.towerdef
{
	import com.poddcorp.towerdef.components.GameState;
	import com.poddcorp.towerdef.components.Position;
	import com.poddcorp.towerdef.input.TouchPoll;
	import com.poddcorp.towerdef.pathfinding.INode;
	import com.poddcorp.towerdef.pathfinding.Pathfinder;
	import com.poddcorp.towerdef.systems.AnimationSystem;
	import com.poddcorp.towerdef.systems.BulletAgeSystem;
	import com.poddcorp.towerdef.systems.BulletSystem;
	import com.poddcorp.towerdef.systems.CollisionSystem;
	import com.poddcorp.towerdef.systems.GameSystem;
	import ash.core.Engine;
	import ash.integration.starling.StarlingFrameTickProvider;
	import ash.integration.swiftsuspenders.SwiftSuspendersEngine;
	import com.poddcorp.towerdef.systems.GunControlSystem;
	import com.poddcorp.towerdef.systems.MovementSystem;
	import com.poddcorp.towerdef.systems.TileRenderSystem;
	import com.poddcorp.towerdef.systems.TileTraversalSystem;
	import com.poddcorp.towerdef.UI.TowerButton;
	import com.poddcorp.towerdef.UI.TowerUpgrade;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.text.TextField;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import com.poddcorp.towerdef.systems.RenderSystem;
	import com.poddcorp.towerdef.systems.SystemPriorities;
	
	import org.swiftsuspenders.Injector;
	
	/**
	 * Tower Defense Class for Main Game
	 */
	
	public class TowerDefense extends Sprite
	{
		//Creates a new variable for Engine
		private var _engine:Engine;
		
		//Creates a new variable for Injector of Swiftsuspenders
		private var _injector:Injector;
		
		//Creates a new variable for TouchPoll
		private var _touchPoll:TouchPoll;
		
		//Creates a new variable for IsoMap
		public var _map:IsoMap;
		
		//Creates a new variable for INode
		private var _inode:INode;
		
		//Creates a new variable for Grass Map
		private var _grassmap:Image;
		
		//Creates a new variable for Tower Holder
		private var _towerHolder:Image;
		
		//Creates a new variable for Hud
		private var _hudHorizontal:Image;
		
		//Creates a new variable for TowerUpgrade
		private var _towerUpgrade:TowerUpgrade;
		
		//Creates a new variable for Village Name
		public var _village:TextField;
		
		//Creates a new variable for Life Remaining
		public var _lifeRemaining:TextField;
		
		//Creates a new variable for Life Count
		public var _lifeCount:GameState = new GameState();
				
		//Creates a new variable for Tower Button
		private var _towerButton:TowerButton;
		
		//Creates a new variable for Starling Frame Tick Provider
		public var _tickProvider:StarlingFrameTickProvider = new StarlingFrameTickProvider(Starling.current.juggler);
		
		/**
		 * Tower Defense
		 */
		public function TowerDefense():void
		{
			//Initializes tower defense
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			//Assigns new Image to Grass Map variable
			_grassmap = new Image(UIAssets.getUITexture("plainMap"));
		}
		
		/**
		 * Event Handler of Tower Defense Initialization
		 */
		private function onEnterFrame(event:Event):void
		{
			//Removes EnterFrame event listener
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			//Calls prepare function
			prepare();
			
			//Calls start function
			start();
			
			//creates UI
			createUI();
		}
		
		/**
		 * Updates UI on every resize Event
		 */
		public function updateUI():void
		{
			var viewPort:Rectangle = Starling.current.viewPort;
			_hudHorizontal.x = viewPort.width - _hudHorizontal.width;
			_hudHorizontal.y = 10;
			
			_towerButton.x = viewPort.width - 200;
			_towerButton.y = viewPort.height - 200;
			
			_towerHolder.x = viewPort.width - 210;
			_towerHolder.y = viewPort.height - 210;
			
			_village.text = "Orto Village";
			_village.x = _hudHorizontal.x;
			_village.y = 10;
			
			_lifeRemaining.text = "" + _lifeCount.lives + "/10";
			_lifeRemaining.x = _hudHorizontal.x;
			_lifeRemaining.y = _hudHorizontal.y * 2 + _hudHorizontal.height;
			
		}
		
		private function prepare():void
		{
			//Initializes Injector
			_injector = new Injector();
			
			//Initializes engine as Swiftsuspenders Engine
			_engine = new SwiftSuspendersEngine(_injector);
			
			//Initializes touchpoll
			_touchPoll = new TouchPoll(this);
			
			//Initializes towerupgrade
			_towerUpgrade = new TowerUpgrade();
			
			//Adds grassmap to Stage
			addChild(_grassmap);
			
			//Initializes map with Row and Column
			_map = new IsoMap(12, 12);
			
			//Draws map
			_map.drawMap();
			
			//Adds map to stage
			addChild(_map);
			
			//Sets starttile and endtile
			var startTile:IsoTile = _map.getTile(11, 0);
			var endTile:IsoTile = _map.getTile(0, 11);
			
			//Sets variable of map starttile and endtile to local starttile and endtile
			_map._startTile = startTile;
			_map._endTile = endTile;
			
			//Sets color of starttile and endtile
			startTile.highlight(0xFF0000);
			endTile.highlight(0x00FF00);
			
			//Sets default heuristic pathfinder
			Pathfinder.heuristic = Pathfinder.euclidianHeuristic;
			
			//Maps Engine
			_injector.map(Engine).toValue(_engine);
			
			//Maps DisplayObjectContainer
			_injector.map(DisplayObjectContainer).toValue(_map.tileHolder);
			
			//Maps GameConfig
			_injector.map(GameConfig).asSingleton();
			
			//Maps EntityCreator
			_injector.map(EntityCreator).asSingleton();
			
			//Maps TouchPoll
			_injector.map(TouchPoll).toValue(_touchPoll);
			
			//Maps IsoMap
			_injector.map(IsoMap).toValue(_map);
			
			//Maps INode
			_injector.map(INode).toValue(_inode);
			
			//Maps startTile and endTile
			_injector.map(IsoTile, "start").toValue(startTile);
			_injector.map(IsoTile, "end").toValue(endTile);
			
			//Sets TowerButton to _towerButton
			_injector.map(TowerButton).toValue(_towerButton);
			
			//Initializes config as Instance of GameConfig
			var config:GameConfig = _injector.getInstance(GameConfig);
			
			//Creates stageas Starling nativeStage
			var stage:Stage = Starling.current.nativeStage;
			
			//Sets width and height in config variable
			config.height = stage.stageHeight;
			config.width = stage.stageWidth;
			
			//Sets coordinates of Map
			_map.x = (stage.stageWidth >> 1) + (startTile.width / 2);
			_map.y = (stage.stageHeight - _map.height >> 1) + (startTile.height);
			
			//Adds GameSystem to System
			_engine.addSystem(new GameSystem(), SystemPriorities.preUpdate);
			
			//Adds Animation to System
			_engine.addSystem(new AnimationSystem(), SystemPriorities.animate);
			
			//Adds MovementSystem to System
			_engine.addSystem(new MovementSystem(), SystemPriorities.move);
			
			//Adds TileTraversalSystem to System
			_engine.addSystem(new TileTraversalSystem(), SystemPriorities.prerender);
			
			//Adds TileRenderSystem to System
			_engine.addSystem(new TileRenderSystem(), SystemPriorities.prerender);
			
			//Adds GunControlSystem to System
			_engine.addSystem(new GunControlSystem(), SystemPriorities.move);
			
			//Adds Collision to System
			_engine.addSystem(new CollisionSystem(), SystemPriorities.update);
			
			//Adds BulletAgeSystem to System
			_engine.addSystem(new BulletAgeSystem(), SystemPriorities.update);
			
			//Adds BulletSystem to System
			_engine.addSystem(new BulletSystem(), SystemPriorities.prerender);
			
			//Adds RenderSystem to System
			_engine.addSystem(new RenderSystem(), SystemPriorities.render);
			
			//Initializes EntityCreator as Instance of EntityCreator
			var creator:EntityCreator = _injector.getInstance(EntityCreator);
			
			//Creates game
			creator.createGame();

			//Sets creator of map to creator variable of TowerDefense
			_map.creator = creator;
			
			//Sets map of touchpoll to map variable of TowerDefense
			_touchPoll.map = _map;
			
			
		}
		
		//Creates UI Ingame
		private function createUI():void
		{
			//Assigns towerbutton as TowerButton class
			_towerButton = new TowerButton();
			
			//Sets tower holder as Image in Spritesheet
			_towerHolder = new Image(UIAssets.getAtlas().getTexture("hud_towerholder"));
			
			//Sets HUD as Image in Spritesheet
			_hudHorizontal = new Image(UIAssets.getAtlas().getTexture("hud_game"));
			
			//Sets Village Name as Textfield
			_village = new TextField(_hudHorizontal.width, _hudHorizontal.height, "", "MyFont1", 20, 0xFFFFFF); 
			
			//Sets LifeRemaining as Textfield
			_lifeRemaining = new TextField(_hudHorizontal.width, _hudHorizontal.height, "", "MyFont1", 20, 0xFFFFFF); 
			
			//Adds HUD to stage
			addChild(_hudHorizontal);
			
			//Adds Tower Holder to stage
			addChild(_towerHolder);
			
			//Adds Tower Button to stage
			addChild(_towerButton);
			
			//Adds Village Name to Stage
			addChild(_village);
			
			//Adds Life Remaining to Stage
			addChild(_lifeRemaining);
			
			//Updates UI
			updateUI();
		}
		
		/**
		 * Starts tickprovider with Engine
		 */
		public function start():void
		{
			//Adds Engine update to tickprovider
			_tickProvider.add(_engine.update);
			
			//Starts tickprovider
			_tickProvider.start();
		}
		
		/**
		 * Stops tickprovider
		 */
		public function stop():void
		{
			_tickProvider.stop();
		}
	
	}

}