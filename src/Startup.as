package
{
	import flash.display.Sprite;
	import starling.core.Starling;
	import com.mviernes.games.Game;
	
	/**
	 * This is a simple and quick demonstration of using the Starling framework.  http://gamua.com/starling/
	 * @author mviernes
	 */
	[SWF(width="640", height="640", frameRate="60", backgroundColor="#ffffff")]
	public class Startup extends Sprite
	{
		/**
		 * Starling object.
		 */
		private var _starling:Starling;
		
		/**
		 * Constructor.
		 */
		public function Startup()
		{
			init();
		}
		
		/**
		 * Initialize.
		 */
		public function init():void
		{
			// starling setup
			_starling = new Starling(Game, stage);
			_starling.start();
		}
	}
}