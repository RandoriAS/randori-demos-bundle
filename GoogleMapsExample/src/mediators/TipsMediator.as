package mediators {
    import eventbus.AppEventsBus;
    import randori.behaviors.AbstractMediator;
    import randori.jquery.JQuery;
    import randori.webkit.page.Window;

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

        [View]
        public var showMapItem:JQuery;

        override protected function onRegister():void {
            //bus.navigationRequest.add( handleNavigationRequest );
            showMapItem.click( handleNavigationRequest );

        }

        private function handleNavigationRequest( ):void {
            var navto:String = showMapItem.data( "navto" );
            if( navto == "showMapItem"){
                Window.console.log('TIPS LINK HIT');
                // SEND AN EVENT TO THE MAP ON THE INDEX
                Window.console.log('LINK: ' + showMapItem.text());
                Window.console.log('LOC: ' + showMapItem.data( "loc"));
            }
        }
    }
}