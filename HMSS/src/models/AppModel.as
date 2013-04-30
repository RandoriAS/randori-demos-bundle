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


package models {
	import eventBus.HMSSBus;

	import models.user.User;

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