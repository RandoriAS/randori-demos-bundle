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

    import randori.async.Promise;

    import randori.behaviors.AbstractMediator;
    import randori.behaviors.ViewStack;
    import randori.jquery.JQuery;
import randori.webkit.html.HTMLElement;

public class IndexMediator extends AbstractMediator {

        [View(required="true")]
        public var viewStack:ViewStack;

        [View(required="true")]
        public var menu:HorizontalTabs;

        [View]
        public var map:JQuery;

        [Inject]
        public var bus:AppEventsBus;

        override protected function onRegister():void {
            bus.navigationRequest.add( handleNavtoRequest );

            var menuItems:Array = new Array(
                    new MenuItem( "How it works", "views/how.html" ),
                    new MenuItem( "Tips", "views/tips.html" ),
                    new MenuItem( "The flow", "views/flow.html"),
                    new MenuItem( "And the details", "views/details.html"  )
            );

            menu.menuItemSelected.add( menuItemSelected );
            menu.data = menuItems;

           showMap();

        }

        private function handleNavtoRequest( navto:String ):void {
            if( navto == "tips"){
                menu.selectedIndex = 1;
                //viewStack.pushView("views/tips.html");
              // viewStack.selectView("views/tips.html");
            }

        }

        private function menuItemSelected( menuData:MenuItem ):void {
            viewStack.popView();
            var promise:Promise = viewStack.pushView(menuData.url);

            promise.then( function( result:AbstractMediator ):void {
                //do something here with the new view if you want
            } );

        }

        private function showMap():void{
            var mapOptions:MapOptions = new MapOptions();
            mapOptions.center = new LatLng(33.748893,-84.388046);
            mapOptions.zoom = 8;
            mapOptions.mapTypeId = "roadmap"; //MapTypeId.ROADMAP;

            var newMap:Map = new Map(map[0] as HTMLElement, mapOptions);
        }


    }
}