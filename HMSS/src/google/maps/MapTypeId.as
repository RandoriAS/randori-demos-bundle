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
 * @author Michael Labriola <labriola@digitalprimates.net>
 */

package google.maps {

	[JavaScript(export="false",name="google.maps.MapTypeId")]
	public class MapTypeId {

		public static const ROADMAP:String = "roadmap"; // displays the normal, default 2D tiles of Google Maps.
		public static const SATELLITE:String = "satellite"; // displays photographic tiles.
		public static const HYBRID:String ="hybrid";// displays a mix of photographic tiles and a tile layer for prominent features (roads, city names).
		public static const TERRAIN:String = "terrain";// displays physical relief tiles for displaying elevation and water features (mountains, rivers, etc.).

		public function MapTypeId() {
		}
	}
}