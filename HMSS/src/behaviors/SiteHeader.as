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

package behaviors
{
	import eventBus.HMSSBus;

	import models.user.User;

	import randori.behaviors.AbstractBehavior;
	import randori.jquery.JQuery;

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