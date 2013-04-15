package mediators {
import eventbus.AppEventsBus;

import model.ExternalLink;

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

        [View]
        public var goToNewPage:JQuery;

        override protected function onRegister():void {
            goToTips.click( handleLinkClick );

            goToNewPage.click( handleExternalLink );
        }

        private function handleLinkClick():void {

            var navto:String = goToTips.data( "navto" );
            bus.navigationRequest.dispatch( navto );
        }

        private function handleExternalLink():void {
            var extLink:ExternalLink = new ExternalLink();
            extLink.type =  goToNewPage.data( "navto" );
            extLink.destination =  goToNewPage.data( "destination" );
            extLink.target =  goToNewPage.data( "target" );

            bus.externalNavigationRequest.dispatch( extLink );
        }

}
}