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
 * Date: 4/24/13
 * Time: 6:34 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package services
{
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.IntelParser;

	/**
	 * Service for getting RSS feed from intel sources
	 */
	public class IntelService extends AbstractService
	{
		/**
		 * parses the result
		 */
		private var parser:IntelParser;

		/**
		 * source path to the feed data
		 */
		private var path:String;

		/**
		 * a proxied path to the feed to get around any CORS issues
		 */
		private var proxiedPath:String;

		/**
		 * gets the intel data
		 */
		public function get() : Promise
		{
			var promise:Promise = sendRequest("GET", proxiedPath);
			var parserPromise:Promise = promise.then(parser.parseResult);

			return parserPromise;
		}

		/**
		 * Constructor
		 */
		public function IntelService(xmlHttpRequest:XMLHttpRequest, parser:IntelParser)
		{
			super(xmlHttpRequest);

			this.parser = parser;
			this.path = "https://www.cia.gov/news-information/your-news/cia-press-releases-statements/RSS.xml";
			// feeds were rejecting requests from localhost, so proxying it through yahoo to get around that. also gives
			// us the opportunity to convert from xml to json for easier parsing.
			this.proxiedPath = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D'" + encodeURI(this.path) +"'&format=json";
		}
	}
}