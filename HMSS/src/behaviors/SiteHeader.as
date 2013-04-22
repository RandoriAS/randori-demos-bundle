package behaviors
{
	import eventBus.HMSSBus;

	import models.user.User;

	import randori.behaviors.AbstractBehavior;
	import randori.jquery.JQuery;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 10:41 AM
	 * To change this template use File | Settings | File Templates.
	 */
	public class SiteHeader extends AbstractBehavior
	{

		[Inject]
		public var evtBus:HMSSBus;

		[View]
		public var userName:JQuery;

		public function showUsername(nameStr:String):void
		{
			userName.text("Welcome: " + nameStr);
		}

		public function noUserLoggedIn():void
		{
			userName.text("Not Signed In.");
		}

		protected function currentUser_changeHandler( usr:User ):void
		{
			if( usr != null )
			{
				showUsername( "("+ usr.codeName + ") " + usr.lastName + ", " + usr.firstName );
			}
			else
			{
				noUserLoggedIn();
			}
		}

		override protected function onRegister():void
		{
			evtBus.userChanged.add( currentUser_changeHandler );
		}

		public function SiteHeader()
		{
			super();
		}

	}
}