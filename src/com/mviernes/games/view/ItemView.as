package com.mviernes.games.view
{
	import com.mviernes.games.model.ItemModel;
	
	import starling.display.Image;
	import starling.textures.Texture;

	/**
	 * This class contains UI and UI logic for
	 */
	public class ItemView extends Image
	{
		/**
		 * Item model.
		 */
		private var _itemModel:ItemModel;
		
		/**
		 * Constructor.
		 * @param texture Store info that represents image.
		 * @param model ItemModel.
		 */
		public function ItemView( texture:Texture, model:ItemModel )
		{
			_itemModel = model;
			
			super(texture);
		}
		
		/**
		 * Move item.
		 */
		public function moveItem():void
		{
			this.y += _itemModel.moveAmount;
		}
		
		public function get itemModel():ItemModel
		{
			return _itemModel;
		}
		
		public function set itemModel(value:ItemModel):void
		{
			_itemModel = value;
		}
	}
}