package mediators {
import eventbus.AppEventsBus;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;

/**
     * Created with IntelliJ IDEA.
     * User: leifwells
     * Date: 4/12/13
     * Time: 3:17 PM
     * To change this template use File | Settings | File Templates.
     */
    public class GeneralContentMediator extends AbstractMediator {

        [Inject]
        public var bus:AppEventsBus;

        [View]
        public var goToTips:JQuery;

        override protected function onRegister():void {
            goToTips.click( handleLinkClick );

        }

        private function handleLinkClick():void {
            var navto:String = goToTips.data( "navto" );
            bus.navigationRequest.dispatch( navto );
        }
    }
}