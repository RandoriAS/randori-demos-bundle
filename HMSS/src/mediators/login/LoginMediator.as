/***
 * Copyright 2013 LTN Consulting, Inc. /dba Digital Primates®
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *
 * @author Ben Schmidtke <bschmidtke@digitalprimates.net>
 */


package mediators.login {
	import eventBus.HMSSBus;

	import models.user.User;

	import randori.behaviors.AbstractMediator;
	import randori.jquery.Event;
	import randori.jquery.JQuery;
import randori.webkit.page.Window;

import services.AgentService;

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

		[View]
		public var loginErrorTxt:JQuery;

		[Inject]
		public var loginService:AgentService;


		protected function loginButton_clickHandler( event:Event ):void
		{
			var codeName:String =  userNameInput.val();
			var passCode:String = passwordInput.val();

			loginService.login(codeName, passCode).then( loginSuccess, loginFailure );
		}

		protected function loginSuccess( data:User ):void
		{
			evtBus.loginSuccess.dispatch( data );
		}

		protected function loginFailure( data:Object ):void
		{
			loginErrorTxt.show();
		}

		override public function initialize():void	{
			super.initialize();

			loginButton.click( loginButton_clickHandler );
			loginErrorTxt.hide();
		}

		public function LoginMediator()
		{
			super();
		}
	}
}