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
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */

package services
{
	import models.tasks.Task;

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
		 * create a new task
		 *
		 * Note:
		 * this is a stub/simulation of a POST. what we're doing here is re-grabbing all the
		 * original data and appending the provided task to it, then returning it as an array
		 * via the promise. the tasks grid works with a data property, not a dataview we can
		 * add an element to, so we're providing *all* the data it needs.
		 *
		 * further note that we're not actually persisting any tasks added through the task admin
		 * mechanism; we'll only return what's in the original data plus the latest.
		 */
		public function create(task:Task) : Promise
		{
			var promise:Promise = sendRequest("GET", path);
			var parserPromise:Promise = promise.then(function(data:Object):Array
			{
				var json:Object = JSON.parse(data as String);
				var tasks:Array = json as Array;
				tasks.push(task);
				return tasks;
			});

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