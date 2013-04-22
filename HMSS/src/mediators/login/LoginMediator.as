package mediators.login {
	import eventBus.HMSSBus;

	import models.user.User;

	import randori.behaviors.AbstractMediator;
	import randori.jquery.Event;
	import randori.jquery.JQuery;

	import services.AgentService;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 1:51 PM
	 * To change this template use File | Settings | File Templates.
	 */
	public class LoginMediator extends AbstractMediator
	{

		[Inject]
		public var evtBus:HMSSBus;

		//----------------------------------------------------------------------------
		//
		// Visual elements
		//
		//----------------------------------------------------------------------------

		[View]
		public var userNameInput:JQuery;

		[View]
		public var passwordInput:JQuery;

		[View]
		public var loginButton:JQuery;

		[Inject]
		public var loginService:AgentService;


		protected function loginButton_clickHandler( event:Event ):void
		{
			var codeName:String =  userNameInput.val();
			var passCode:String = passwordInput.val();

			loginService.login(codeName, passCode).then( loginSuccess, loginFailure );

		}

		protected function loginSuccess( data:User )
		{
			evtBus.loginSuccess.dispatch( data );
		}

		protected function loginFailure( data:Object )
		{
			// hidden login text, enable on failure
			// login count
			//evtBus.loginFailure.dispatch( usr );
		}

		override protected function onRegister():void
		{
			super.onRegister();

			loginButton.click( loginButton_clickHandler );
		}

		public function LoginMediator()
		{
			super();
		}
	}
}