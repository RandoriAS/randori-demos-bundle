package models.user {

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

	[JavaScript(export="false")]
	public class User {


		private var _firstName:String;
		private var _lastName:String;
		private var _codeName:String;
		private var _role:String;

		public function User() {
		}

		public function get firstName():String
		{
			return _firstName;
		}

		public function set firstName( value:String ):void
		{
			_firstName = value;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function set lastName( value:String ):void
		{
			_lastName = value;
		}

		public function get codeName():String
		{
			return _codeName;
		}

		public function set codeName( value:String ):void
		{
			_codeName = value;
		}

		public function get role():String
		{
			return _role;
		}

		public function set role( value:String ):void
		{
			_role = value;
		}
	}
}