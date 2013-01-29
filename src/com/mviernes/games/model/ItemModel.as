package com.mviernes.games.model
{
	/**
	 * This class contains data for the item, such as move amount in pixels.
	 */
	public class ItemModel
	{
		/**
		 * Move amount.
		 */
		private var _moveAmount:Number = 3;
		
		/**
		 * Checked hit test.
		 */
		private var _checkedHitTest:Boolean = false;
		
		/**
		 * Constructor.
		 */
		public function ItemModel()
		{
		}

		public function get moveAmount():Number
		{
			return _moveAmount;
		}

		public function set moveAmount(value:Number):void
		{
			_moveAmount = value;
		}
		
		public function get checkedHitTest():Boolean
		{
			return _checkedHitTest;
		}
		
		public function set checkedHitTest(value:Boolean):void
		{
			_checkedHitTest = value;
		}

	}
}