package com.mviernes.games.controller
{
	import com.mviernes.games.event.GameEvent;
	import com.mviernes.games.model.CharacterModel;
	import com.mviernes.games.model.GameModel;
	import com.mviernes.games.view.CharacterView;
	import com.mviernes.games.view.GameView;
	import com.mviernes.games.view.ItemView;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * Game controller that contains game logic.
	 */
	public class GameController
	{
		/**
		 * Game model.
		 */
		private var _gameModel:GameModel;
		
		/**
		 * Game view.
		 */
		private var _gameView:GameView;
		
		/**
		 * Timer for moving more items.
		 */
		private var _addItemTimer:Timer;
		
		/**
		 * Constructor.
		 * @param model GameModel.
		 * @param view GameView.
		 */
		public function GameController( model:GameModel, view:GameView )
		{
			// game model
			_gameModel = model;
			
			// game view
			_gameView = view;
			
			// listen for when images are all loaded and ready
			_gameView.addEventListener(GameEvent.IMAGES_READY, onImagesReady);
		}
		
		/**
		 * On images ready.
		 * @param event Starling event for images loaded and ready.
		 */
		private function onImagesReady(event:starling.events.Event):void
		{
			startTimer();
		}
		
		/**
		 * Start timer for moving items.
		 */
		private function startTimer():void
		{
			_addItemTimer = new Timer(_gameModel.itemsTimerDelay, _gameModel.maxItems);
			_addItemTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
			_addItemTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			_addItemTimer.start();
		}
		
		/**
		 * On timer tick.
		 * @param event TimerEvent.
		 */
		private function onTimerTick( event:TimerEvent ):void
		{
			// increment number of moving items
			_gameModel.movingItemsCounter++;
		}
		
		/**
		 * Timer complete.
		 * @param event TimerEvent.
		 */
		private function onTimerComplete( event:TimerEvent ):void
		{
			_addItemTimer.stop();
			_addItemTimer.removeEventListener(TimerEvent.TIMER, onTimerTick);
			_addItemTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		/**
		 * Check key down.
		 * @param event Starling keyboard event.
		 */
		public function checkKeyDown(event:starling.events.KeyboardEvent):void
		{
			var characterModel:CharacterModel = _gameView.characterView.characterModel;
			characterModel.isMoving = true;
			if (event.keyCode == 37) {
				characterModel.left = true;
			} else if (event.keyCode == 39) {
				characterModel.right = true;
			}
		}
		
		/**
		 * Check key up.
		 * @param event Starling keyboard event.
		 */
		public function checkKeyUp(event:starling.events.KeyboardEvent):void
		{
			var characterModel:CharacterModel = _gameView.characterView.characterModel;
			characterModel.isMoving = false;
			if (event.keyCode == 37) {
				characterModel.left = false;
			} else if (event.keyCode == 39) {
				characterModel.right = false;
			}
		}
		
		/**
		 * Move objects.
		 * @param event Starling enter frame event.
		 */
		public function moveObjects(event:starling.events.Event):void
		{
			// move character
			if ( _gameView.characterView.x < 0) {
				_gameView.characterView.x = 0;
			} else if ( _gameView.characterView.x > 500 ) {
				_gameView.characterView.x = 500;
			} else {
				_gameView.characterView.moveCharacter();
			}
			
			// move items
			for (var i:int = 0; i < _gameModel.movingItemsCounter; i++) {
				_gameModel.itemsList[i].moveItem();
				if (_gameModel.itemsList[i].y > 440 && _gameModel.itemsList[i].y < 460) {
					checkHit( _gameView.characterView, _gameModel.itemsList[i] );
				}
			}
		}
		
		/**
		 * Check hit between character and item.
		 * @param character CharacterView.
		 * @param item ItemView.
		 * TODO: More specific hit testing (i.e. hitting character's box opening).
		 */
		private function checkHit( character:CharacterView, item:ItemView ):void
		{
			if (character.getBounds(character.parent).intersects(item.getBounds(item.parent))) {
				if (!item.itemModel.checkedHitTest) {
					_gameModel.itemsCaughtCounter++;
					_gameView.displayHit( _gameModel.itemsCaughtCounter, _gameModel.maxItems );
					item.itemModel.checkedHitTest = true;
				}
			}
		}
	}
}