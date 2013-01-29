package com.mviernes.games.model
{
	/**
	 * This class contains data for the character, such as whether it is moving, its direction, and move amount in pixels.
	 */
	public class CharacterModel
	{
		/**
		 * Is the character moving.
		 */
		private var _isMoving:Boolean = false;
		
		/**
		 * Moving left.
		 */
		private var _left:Boolean = false;
		
		/**
		 * Moving right.
		 */
		private var _right:Boolean = false;
		
		/**
		 * Number of pixels for moving.
		 */
		private var _moveAmount:Number = 6;
		
		/**
		 * Constructor.
		 */
		public function CharacterModel()
		{
		}
		
		public function get right():Boolean
		{
			return _right;
		}
		
		public function set right(value:Boolean):void
		{
			_right = value;
		}
		
		public function get left():Boolean
		{
			return _left;
		}
		
		public function set left(value:Boolean):void
		{
			_left = value;
		}
		
		public function get isMoving():Boolean
		{
			return _isMoving;
		}
		
		public function set isMoving(value:Boolean):void
		{
			_isMoving = value;
		}

		public function get moveAmount():Number
		{
			return _moveAmount;
		}

		public function set moveAmount(value:Number):void
		{
			_moveAmount = value;
		}

	}
}