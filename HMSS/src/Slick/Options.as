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

package Slick {

	/**
	 * Created with IntelliJ IDEA.
	 * User: mlabriola
	 * Date: 4/18/13
	 * Time: 11:13 AM
	 * To change this template use File | Settings | File Templates.
	 */
	[JavaScript(export="false",name="Object",mode="json")]
	public class Options {

		/**
		 * @default false
		 */
		public var autoHeight:Boolean;

		/**
		 * Appears to enable cell virtualisation for optimised speed with large datasets
		 *
		 * @default true
		 */
		public var enableCellNavigation:Boolean;

		/**
		 * @default true
		 *
		 * @requires jquery-ui.sortable
		 */
		public var enableColumnReorder:Boolean;

		/**
		 * c.f. http://mleibman.github.io/SlickGrid/examples/example-explicit-initialization.html
		 * @default false
		 */
		public var explicitInitialization:Boolean;

		/**
		 * Force column sizes to fit into the container (preventing horizontal scrolling). Effectively sets column width to be 1/Number of Columns which on small containers may not be desirable.
		 *
		 * @default false
		 */
		public var forceFitColumns:Boolean;

		/**
		 * Constructor
		 */
		public function Options() {
		}
	}
}