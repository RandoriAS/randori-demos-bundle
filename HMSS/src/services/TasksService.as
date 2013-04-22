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
 * @author Mike Labriola <labriola@digitalprimates.net>
 */


package services
{
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.GenericJsonParser;

	/**
	 * Service for getting tasks
	 */
	public class TasksService extends AbstractService
	{
		/**
		 * parses the result
		 */
		private var parser:GenericJsonParser;

		/**
		 * path to the data
		 */
		private var path:String;

		/**
		 * Gets the tasks
		 */
		public function get() : Promise
		{
			var promise:Promise = sendRequest("GET", path);
			var parserPromise:Promise = promise.then(parser.parseResult);

			return parserPromise;
		}

		/**
		 * Constructor
		 */
		public function TasksService(xmlHttpRequest:XMLHttpRequest, parser:GenericJsonParser)
		{
			super(xmlHttpRequest);

			this.parser = parser;
			this.path = "assets/data/tasks.txt";
		}
	}
}