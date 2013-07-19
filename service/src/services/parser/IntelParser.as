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
 * Date: 4/25/13
 * Time: 4:14 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package services.parser
{
	import randori.service.parser.AbstractParser;

	/**
	 * Parser for intel data. Takes CIA rss/rdf feed and turns it into json.
	 */
	public class IntelParser extends AbstractParser
	{
		/**
		 * @inheritDoc
		 */
		public function parseResult(result:Object) : Array
		{
			// note that the passed-in result is a string representing a json object
			var json:Object = JSON.parse(result as String);

			// this parsing is specific to the CIA feed
			var feedItems:Array = json.query.results.RDF.item as Array;

			return feedItems;
		}

		/**
		 * Constructor
		 */
		public function IntelParser()
		{
		}
	}
}