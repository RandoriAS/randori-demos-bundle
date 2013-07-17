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
package mediators {
	import eventBus.HMSSBus;

	import google.maps.LatLng;
	import google.maps.Map;
	import google.maps.MapOptions;
	import google.maps.MapTypeId;
	import google.maps.Marker;

	import randori.behaviors.AbstractMediator;
	import randori.behaviors.List;
	import randori.webkit.html.HTMLElement;

	import services.TargetsService;
	import services.vo.Target;

	public class TargetsMediator extends AbstractMediator
	{

		[View]
		public var map:Map;

		[View]
		public var targetList:List;

		[Inject]
		public var service:TargetsService;

		[Inject]
		public var bus:HMSSBus;

		override public function initialize():void	{
			// add selection / change handler to the list
			targetList.listChanged.add( handleTargetSelected );

			//  load targets
			service.get().then( targetsReceived );
		}

		private function targetsReceived( results:Array ):void
		{
			assignListData( results );
			plotTargetsOnMap( results );
		}

		private function handleTargetSelected( target:Target ):void
		{
			bus.targetSelected.dispatch( targetList.selectedItem );
		}

		protected function assignListData( results:Array ):void
		{
			targetList.data = results;
		}

		protected function plotTargetsOnMap( results:Array ):void
		{
			// initialize map.
			var mapOptions:MapOptions = new MapOptions();
			mapOptions.center = new LatLng(32.7502,6.1916);
			mapOptions.zoom = 2;
			mapOptions.mapTypeId = MapTypeId.SATELLITE;

			map = new Map(map[0] as HTMLElement, mapOptions);

			if( results != null && results.length > 0 )
			{
				for ( var i:int = 0; i < results.length; i++ )
				{
					var target:Target = results[i] as Target;
					//if( !isNaN( target.latitude ) && !isNaN( target.longitude )  )
					//{
						var config:Object = new Object();
						config.title = target.name;
						config.position = new LatLng(target.latitude, target.longitude);
						config.map = map;
						var marker:Marker = new Marker( config );
					//}
				}
			}
		}


		public function TargetsMediator( ) {
			super();
		}
	}
}