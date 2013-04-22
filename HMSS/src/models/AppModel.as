package models {
	import eventBus.HMSSBus;

	import models.user.User;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 1:37 PM
	 * To change this template use File | Settings | File Templates.
	 */
	public class AppModel
	{

		[Inject]
		protected var evtBus:HMSSBus;

		private var _currentUser:User;

		public function AppModel()
		{

		}

		public function get currentUser():User
		{
			return _currentUser;
		}

		public function set currentUser(value:User):void
		{
			_currentUser = value;

			evtBus.userChanged.dispatch( _currentUser );
		}
	}
}