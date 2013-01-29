package com.mviernes.games
{
	import com.mviernes.games.controller.GameController;
	import com.mviernes.games.event.GameEvent;
	import com.mviernes.games.model.GameModel;
	import com.mviernes.games.view.GameView;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * Main game class.
	 */
	public class Game extends Sprite
	{
		/**
		 * XML loader.
		 */
		private var _urlLoader:URLLoader;
		
		/**
		 * Game model.
		 */
		private var _gameModel:GameModel;
		
		/**
		 * Game view.
		 */
		private var _gameView:GameView;
		
		/**
		 * Game controller.
		 */
		private var _gameController:GameController;
		
		/**
		 * Constructor.
		 */
		public function Game()
		{
			init();
		}
		
		/**
		 * Initialize game.
		 */
		public function init():void
		{
			// set up framework
			_gameModel = new GameModel();
			_gameView = new GameView( _gameModel );
			_gameController = new GameController( _gameModel, _gameView );
			
			// add game view to display list
			addChild( _gameView );
			
			// load configuration file
			loadConfig( _gameModel.configUrl );
			
		}
		
		/**
		 * Load configuration file.
		 * @parm url URL of configuration file.
		 */
		private function loadConfig( url:String ):void
		{
			_urlLoader = new URLLoader();
			_urlLoader.load( new URLRequest( url ) );
			_urlLoader.addEventListener(flash.events.Event.COMPLETE, onLoadConfigComplete);
		}
		
		/**
		 * On load configuration complete.
		 * @param event Flash event complete.
		 * TODO: Create XML loader utility class.
		 */
		private function onLoadConfigComplete(event:flash.events.Event):void
		{
			var xml:XML = new XML( event.target.data );
			_gameModel.bgImagePath = xml.bgImagePath;
			_gameModel.characterImagePath = xml.characterImagePath;
  			_gameModel.goodItemImagePath = xml.goodItemImagePath;
			
			// start loading external images
			_gameView.init();
			
			// listen for when all images have been loaded and ready
			_gameView.addEventListener(GameEvent.IMAGES_READY, onImagesReady);
		}
		
		/**
		 * Images ready.
		 * @param event Starling event for images loaded and ready.
		 */
		private function onImagesReady(event:starling.events.Event):void
		{
			addListeners();
		}
		
		/**
		 * Add listeners for keys and enter frame.
		 */
		private function addListeners():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, _gameController.checkKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, _gameController.checkKeyUp);
			stage.addEventListener(starling.events.Event.ENTER_FRAME, _gameController.moveObjects);
		}
		
	}
}