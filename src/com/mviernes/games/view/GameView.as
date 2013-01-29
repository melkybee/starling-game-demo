package com.mviernes.games.view
{
	import com.mviernes.games.event.GameEvent;
	import com.mviernes.games.model.CharacterModel;
	import com.mviernes.games.model.GameModel;
	import com.mviernes.games.model.ItemModel;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;

	/**
	 * This class contains the general UI and UI logic for the game.
	 */
	public class GameView extends Sprite
	{
		/**
		 * Game model.
		 */
		private var _gameModel:GameModel;
		
		/**
		 * Image loader.
		 */
		private var _loader:Loader;
		
		/**
		 * Background container.
		 */
		private var _bgContainer:Sprite;
		
		/**
		 * Character container.
		 */
		private var _characterContainer:Sprite;
		
		/**
		 * Item container.
		 */
		private var _itemContainer:Sprite;
		
		/**
		 * Textfield to show HIT.
		 */
		private var _tf:TextField;
		
		/**
		 * Character view.
		 */
		private var _characterView:CharacterView;
		
		/**
		 * Character model.
		 */
		private var _characterModel:CharacterModel;
		
		/**
		 * Constructor.
		 * @param model GameModel.
		 */
		public function GameView( model:GameModel )
		{
			_gameModel = model;
		}
		
		/**
		 * Initialize.
		 */
		public function init():void
		{
			// loader
			_loader = new Loader();
			
			// containers
			_bgContainer = new Sprite();
			_characterContainer = new Sprite();
			_itemContainer = new Sprite();
			
			// add containers to display list
			addChild(_bgContainer);
			addChild(_characterContainer);
			addChild(_itemContainer);
			
			// textfield that shows hit
			_tf = new TextField(300, 30, "", "Verdana", 20);
			addChild(_tf);
			_tf.x = 360;
			_tf.y = 10;
			
			// display number of items caught
			displayHit(_gameModel.itemsCaughtCounter, _gameModel.maxItems);
			
			// load background
			loadBackground( _gameModel.bgImagePath );
		}
		
		/**
		 * Load background image.
		 * @param url URL of background image.
		 * TODO: Create image loader utility class that all image loading can use, then dispatch event when that particular image is ready.
		 */
		private function loadBackground( url:String ):void
		{
			_loader.load( new URLRequest( url ) );
			_loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadBackgroundComplete);
		}
		
		/**
		 * On load background image complete.
		 * @param event Flash event for event complete.
		 */
		private function onLoadBackgroundComplete( event:flash.events.Event ):void
		{
			_loader.removeEventListener(flash.events.Event.COMPLETE, onLoadBackgroundComplete);
			
			// add background to display list
			var loadedImage:Bitmap = event.currentTarget.loader.content as Bitmap;
			var image:Image = new Image(Texture.fromBitmap(loadedImage));
			_bgContainer.addChild(image);
			
			// load character
			loadCharacter( _gameModel.characterImagePath );
		}
		
		/**
		 * Load character image.
		 * @param url URL of character image.
		 * TODO: Create image loader utility class that all image loading can use, then dispatch event when that particular image is ready.
		 */
		private function loadCharacter( url:String ):void
		{
			_loader = new Loader();
			_loader.load( new URLRequest( url) );
			_loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadCharacterComplete);
		}
		
		/**
		 * On load character image complete.
		 * @param event Flash event for event complete.
		 */
		private function onLoadCharacterComplete( event:flash.events.Event ):void
		{
			_loader.removeEventListener(flash.events.Event.COMPLETE, onLoadCharacterComplete);
			var loadedImage:Bitmap = event.currentTarget.loader.content as Bitmap;
			
			// character setup
			_characterModel = new CharacterModel();
			_characterView = new CharacterView(Texture.fromBitmap(loadedImage), _characterModel);
			_characterContainer.addChild(_characterView);
			_characterView.x = 320;
			_characterView.y = 440;
			
			// load all items that will fall
			loadAllItems();
		}
		
		/**
		 * Load all items.
		 */
		private function loadAllItems():void
		{
			for (var i:int = 0; i < _gameModel.maxItems; i++) {
				loadItem( _gameModel.goodItemImagePath );
			}
		}
		
		/**
		 * Load item.
		 * @param url URL of item image.
		 * TODO: Create image loader utility class that all image loading can use, then dispatch event when that particular image is ready.
		 */
		private function loadItem( url:String ):void
		{
			_loader = new Loader();
			_loader.load( new URLRequest( url) );
			_loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadItemComplete);
		}
		
		/**
		 * On load item complete.
		 * @param event Flash event for event complete.
		 */
		private function onLoadItemComplete( event:flash.events.Event ):void
		{
			_loader.removeEventListener(flash.events.Event.COMPLETE, onLoadItemComplete);
			var loadedImage:Bitmap = event.currentTarget.loader.content as Bitmap;
			
			var itemModel:ItemModel = new ItemModel();
			var itemView:ItemView = new ItemView(Texture.fromBitmap(loadedImage), itemModel);
			_itemContainer.addChild(itemView);
			itemView.x = Math.ceil( (Math.random() * 520) + 50 );
			itemView.y = -100;
			
			// add item to items list
			_gameModel.itemsList.push( itemView );
			
			// all items loaded?
			if (_gameModel.itemsList.length == _gameModel.maxItems) {
				this.dispatchEvent(new starling.events.Event(GameEvent.IMAGES_READY));
			}
			
		}
		
		/**
		 * Display number of items caught.
		 */
		public function displayHit( numItems:int, maxItems:int ):void
		{
			_tf.text = "Items Caught: " + numItems + " / " + maxItems;
		}

		public function get characterView():CharacterView
		{
			return _characterView;
		}

		public function set characterView(value:CharacterView):void
		{
			_characterView = value;
		}

	}
}