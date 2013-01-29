package com.mviernes.games.model
{
	import flash.utils.Dictionary;

	/**
	 * This class contains general data for the game.
	 */
	public class GameModel
	{
		/**
		 * Configuration file URL.
		 */
		private var _configUrl:String = "../data/config.xml";
		
		/**
		 * Background image path.
		 */
		private var _bgImagePath:String;
		
		/**
		 * Character image path.
		 */
		private var _characterImagePath:String;
		
		/**
		 * Good item image path.
		 */
		private var _goodItemImagePath:String;
		
		/**
		 * Items timer delay.
		 */
		private var _itemsTimerDelay:int = 2000;
		
		/**
		 * Maximum number of items.
		 */
		private var _maxItems:int = 10;
		
		/**
		 * Counter for number of items moving so far.  This gets incremented on every timer tick.
		 */
		private var _movingItemsCounter:int = 0;
		
		/**
		 * Counter for number of items caught so far.
		 */
		private var _itemsCaughtCounter:int = 0;

		/**
		 * List of items.
		 */
		private var _itemsList:Array;
		
		/**
		 * Constructor.
		 */
		public function GameModel()
		{
			_itemsList = new Array();
		}
		
		public function get configUrl():String
		{
			return _configUrl;
		}
		
		public function set configUrl(value:String):void
		{
			_configUrl = value;
		}

		public function get bgImagePath():String
		{
			return _bgImagePath;
		}

		public function set bgImagePath(value:String):void
		{
			_bgImagePath = value;
		}

		public function get characterImagePath():String
		{
			return _characterImagePath;
		}

		public function set characterImagePath(value:String):void
		{
			_characterImagePath = value;
		}

		public function get goodItemImagePath():String
		{
			return _goodItemImagePath;
		}

		public function set goodItemImagePath(value:String):void
		{
			_goodItemImagePath = value;
		}

		public function get itemsTimerDelay():int
		{
			return _itemsTimerDelay;
		}
		
		public function set itemsTimerDelay(value:int):void
		{
			_itemsTimerDelay = value;
		}

		public function get maxItems():int
		{
			return _maxItems;
		}
		
		public function set maxItems(value:int):void
		{
			_maxItems = value;
		}

		public function get movingItemsCounter():int
		{
			return _movingItemsCounter;
		}

		public function set movingItemsCounter(value:int):void
		{
			_movingItemsCounter = value;
		}
		
		public function get itemsCaughtCounter():int
		{
			return _itemsCaughtCounter;
		}
		
		public function set itemsCaughtCounter(value:int):void
		{
			_itemsCaughtCounter = value;
		}

		public function get itemsList():Array
		{
			return _itemsList;
		}

		public function set itemsList(value:Array):void
		{
			_itemsList = value;
		}


	}
}