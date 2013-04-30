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

package services {
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.UserParser;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 3:38 PM
	 * To change this template use File | Settings | File Templates.
	 */
	public class AgentService extends AbstractService
	{

		private var parser:UserParser;
		private var path:String;

		public function login( userName:String, password:String ):Promise
		{
			var agentPath:String = this.path + "\/" + userName + "\/" + password + ".txt";
			var promise:Promise = sendRequest("GET", agentPath);
			var parserPromise:Promise = promise.then( parser.parseResult );

			return parserPromise;
		}

		public function AgentService(xmlHttpRequest:XMLHttpRequest, parser:UserParser )
		{
			super(xmlHttpRequest);

			this.parser = parser;
			this.path = "assets/data/login/MI6";
		}
	}
}