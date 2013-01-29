package com.mviernes.games.event
{
	import starling.events.Event;
	
	/**
	 * Custom game events.
	 */
	public class GameEvent extends Event
	{
		/**
		 * Images are loaded and ready.
		 */
		public static const IMAGES_READY:String = "GameEvent.IMAGES_READY";
		
		/**
		 * Data passed with event.
		 */
		private var _data:Object;
		
		public function GameEvent( type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			
			_data = data;
		}
		
		public override function get data():Object
		{
			return _data;
		}
		
	}
}