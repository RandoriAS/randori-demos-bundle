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
import randori.jquery.JQuery;
import randori.webkit.html.HTMLElement;
import randori.webkit.page.Window;

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

        public var locations:Array;

        override protected function onRegister():void {
            bus.navigationRequest.add( handleNavigationRequest );
            //bus.showTipOnMapRequest.add( showTipOnMapHandler );
	        bus.tipSelected.add( tipSelectedHandler );
            //bus.externalNavigationRequest.add( handleExternalNavigationRequest );


            var menuItems:Array = new Array(
                    new MenuItem( "How it works", "views/how.html" ),
                    new MenuItem( "Tips", "views/tips.html" ),
                    new MenuItem( "The flow", "views/flow.html"),
                    new MenuItem( "And the details", "views/details.html"  )
            );
	        // TODO: GET THIS DATA FROM THE SERVICE!!!
            menu.menuItemSelected.add( menuItemSelected );
            menu.data = menuItems;

            locations = [];
            locations.push(['Hoki Japanese Restaurant', 33.872368, -84.457749]);
            locations.push(['Hankook Taqueria', 33.811369, -84.43162]);
            locations.push(['Taqueria Del Sol', 33.78728, -84.412926]);
            locations.push(['Rias Bluebird Cafe', 33.746574, -84.365473]);
            locations.push(['Thumbs Up', 33.774903, -84.406575]);

           showMap();

        }

        private function handleNavigationRequest( navto:String ):void {
            if( navto == "tips"){
                menu.selectedIndex = 1;
                //viewStack.pushView("views/tips.html");
              // viewStack.selectView("views/tips.html");
            }
        }

        /*
        private function handleExternalNavigationRequest( extLink:ExternalLink ):void {
            if( extLink.type == "newPage"){
                //OPEN NEW PAGE WITH URL
                Window.console.log('NEW PAGE HIT');
                Window.open(extLink.destination, extLink.target );
            }
        }
        */
        private function menuItemSelected( menuData:MenuItem ):void {
            viewStack.popView();

            /*
             THIS IS ONLY USED FOR CONTROLLING USER CLICKS OF LINKS
            var promise : Promise = viewStack.pushView("views/externalPage.html");

            promise.then( function(mediator:AbstractMediator):void {
                mediator.setViewData( menuData.url )
            } );
            */

            var promise:Promise = viewStack.pushView(menuData.url);

            promise.then( function( result:AbstractMediator ):void {
                //do something here with the new view if you want
            } );
        }

        private function showMap():void{
            /*
            var locations:Array = [
                ['Hoki Japanese Restaurant', 33.872368, -84.457749],
                ['Hankook', 33.872368, -84.457749],
                ['Taqueria Del Sol', 33.811369, -84.43162],
                ['Thumbs Up Diner', 33.78728, -84.412926],
                ['Rias Bluebird Cafe', 33.746574, -84.365473]];
             */

            var mapOptions:MapOptions = new MapOptions();
            mapOptions.center = new LatLng(33.748893,-84.388046);
            mapOptions.zoom = 10;
            mapOptions.mapTypeId = "roadmap"; //MapTypeId.ROADMAP;

            map = new Map(map[0] as HTMLElement, mapOptions);

            for (var i:int = 0; i < locations.length; i++) {
                var loc:Array = locations[i];
                var config:Object = new Object();
                config.title = loc[0];
                config.position = new LatLng(loc[1], loc[2]);
                config.map = map;
                //config.zIndex = i + 1;
                var marker:Marker = new Marker(config);
            }
        }

        private function showTipOnMapHandler( item:JQuery ):void{
            var mapOptions:MapOptions = new MapOptions();
            var center:Array = item.data( "loc").split(",");
            mapOptions.center = new LatLng( center[0], center[1]  );
            mapOptions.zoom = 12;
            mapOptions.mapTypeId = MapTypeId.ROADMAP;
            map.setOptions( mapOptions );
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