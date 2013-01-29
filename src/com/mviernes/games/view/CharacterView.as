package com.mviernes.games.view
{
	import com.mviernes.games.model.CharacterModel;
	
	import starling.display.Image;
	import starling.textures.Texture;

	/**
	 * This class contains the UI and UI logic for character.
	 */
	public class CharacterView extends Image
	{
		/**
		 * Model which holds this character's data.
		 */
		private var _characterModel:CharacterModel;
		
		/**
		 * Constructor.
		 * @param texture Store info that represents image.
		 * @param model CharacterModel.
		 */
		public function CharacterView( texture:Texture, model:CharacterModel )
		{
			_characterModel = model;
			
			super(texture);
		}
		
		/**
		 * Move character.
		 */
		public function moveCharacter():void
		{
			if (_characterModel.isMoving) {  // check if character is able to move
				if (_characterModel.left) {
					this.x -= _characterModel.moveAmount;
				} else {
					this.x += _characterModel.moveAmount;
				}
			}
		}

		public function get characterModel():CharacterModel
		{
			return _characterModel;
		}

		public function set characterModel(value:CharacterModel):void
		{
			_characterModel = value;
		}

	}
}