package mediators {
import eventbus.AppEventsBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.SimpleList;
import randori.jquery.JQuery;
import randori.webkit.page.Window;

import services.TipsService;

/**
     * Created with IntelliJ IDEA.
     * User: leifwells
     * Date: 4/21/13
     * Time: 4:19 PM
     * To change this template use File | Settings | File Templates.
     */

    public class TipsMediator extends AbstractMediator {

        [Inject]
        public var bus:AppEventsBus;

        [Inject]
        public var service:TipsService;

        [View]
        public var showMapItem:JQuery;

        [View]
        public var tipsList:SimpleList;

        override protected function onRegister():void {
            //bus.navigationRequest.add( handleNavigationRequest );
            showMapItem.click( handleNavigationRequest );
            service.get().then( handleServiceResult );

        }

        private function handleServiceResult( result:Array ):void{
            tipsList.data = result;
        }

        private function handleNavigationRequest( ):void {
            var navto:String = showMapItem.data( "navto" );
            if( navto == "showMapItem"){
                Window.console.log('TIPS LINK HIT');
                // SEND AN EVENT TO THE MAP ON THE INDEX
                Window.console.log('LINK: ' + showMapItem.text());
                Window.console.log('LOC: ' + showMapItem.data( "loc"));
                //var show:JQuery = showMapItem;
                bus.showTipOnMapRequest.dispatch( showMapItem );
            }
        }
    }
}