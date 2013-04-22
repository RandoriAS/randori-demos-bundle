package services {
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.GenericJsonParser;

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
	 * Created with IntelliJ IDEA.
	 * Date: 4/22/13
	 * Time: 5:06 PM
	 * @author Ben Schmidtke <bschmidtke@digitalprimates.net>
	 */

	public class MenuService extends AbstractService
	{

		private var parser:GenericJsonParser;
		private var path:String;

		public function get( role:String ):Promise
		{
			var filePath:String = this.path + "\/" + role + "\/" + role + "-menu.txt";
			var promise:Promise = sendRequest("GET", filePath);
			var parserPromise:Promise = promise.then( parser.parseResult );

			return parserPromise;
		}

		public function MenuService( xmlHttpRequest:XMLHttpRequest, parser:GenericJsonParser )
		{
			super( xmlHttpRequest );

			this.path = "assets/data/menu";
			this.parser = parser;
		}
	}
}