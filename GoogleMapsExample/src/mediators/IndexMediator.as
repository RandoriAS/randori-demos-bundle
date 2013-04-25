/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 9:54 AM
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import behaviors.HorizontalTabs;
import behaviors.tabs.MenuItem;

import eventbus.AppEventsBus;

import google.maps.LatLng;
import google.maps.Map;
import google.maps.MapOptions;
import google.maps.MapTypeId;
import google.maps.Marker;

import randori.async.Promise;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.webkit.html.HTMLElement;
import randori.webkit.page.Window;

import services.TipsService;
import services.vo.Tip;

public class IndexMediator extends AbstractMediator {

        [View(required="true")]
        public var viewStack:ViewStack;

        [View(required="true")]
        public var menu:HorizontalTabs;

        [View]
        public var map:Map;

        [Inject]
        public var bus:AppEventsBus;

		[Inject]
		public var service:TipsService;

        public var locations:Array;

		private var selectedMenuItem:MenuItem;

        override protected function onRegister():void {
            bus.navigationRequest.add( handleNavigationRequest );
	        bus.tipSelected.add( tipSelectedHandler );
	        service.get().then( handleServiceResult, handleServiceError );

            var menuItems:Array = new Array(
                    new MenuItem( "How it works", "views/how.html" ),
                    new MenuItem( "Tips", "views/tips.html" ),
                    new MenuItem( "The flow", "views/flow.html"),
                    new MenuItem( "And the details", "views/details.html"  )
            );

            menu.menuItemSelected.add( menuItemSelected );
            menu.data = menuItems;

        }

		private function handleServiceResult( result:Array ):void{
			locations = result;

			showMap();
		}

		private function handleServiceError( error:Object ):void{
			Window.console.log( error );
		}

        private function handleNavigationRequest( navto:String ):void {
            if( navto == "tips"){
                menu.selectedIndex = 1;
            }
        }

        private function menuItemSelected( menuData:MenuItem ):void {
            viewStack.popView();

	        selectedMenuItem = menuData;

            var promise:Promise = viewStack.pushView(menuData.url);

	        promise.then( promiseResult );
            /*
	        promise.then( function( result:AbstractMediator ):void {

            } );
            */
        }

		private function promiseResult( result:AbstractMediator ):void{
			if(selectedMenuItem.name == "How it works"){
				resetMap();
			}
		}

        private function showMap():void{

            var mapOptions:MapOptions = new MapOptions();
            mapOptions.center = new LatLng(33.748893,-84.388046);
            mapOptions.zoom = 10;
            mapOptions.mapTypeId = MapTypeId.ROADMAP;

            map = new Map(map[0] as HTMLElement, mapOptions);

            for (var i:int = 0; i < locations.length; i++) {
	            var location:Tip = locations[i] as Tip;
	            var config:Object = new Object();
	            config.title = location.name;
	            config.position = new LatLng(location.latitude, location.longitude);
	            config.map = map;
	            var marker:Marker = new Marker( config );
            }
        }

		private function resetMap():void{
			var mapOptions:MapOptions = new MapOptions();
			mapOptions.center = new LatLng(33.748893,-84.388046);
			mapOptions.zoom = 10;
			mapOptions.mapTypeId = MapTypeId.ROADMAP;

			map.setOptions(mapOptions);
		}

		private function tipSelectedHandler( tip:Tip):void{
			Window.console.log("Index Tip: " + tip.name);
			var mapOptions:MapOptions = new MapOptions();
			mapOptions.center = new LatLng( tip.latitude, tip.longitude );
			mapOptions.zoom = 12;
			mapOptions.mapTypeId = MapTypeId.ROADMAP;
			map.setOptions( mapOptions );
		}
    }
}