package eventbus {
import randori.signal.SimpleSignal;

/**
     * Created with IntelliJ IDEA.
     * User: leifwells
     * Date: 4/12/13
     * Time: 3:21 PM
     * To change this template use File | Settings | File Templates.
     */
    public class AppEventsBus {

        [Inject]
        public var navigationRequest:SimpleSignal;

        [Inject]
        public var externalNavigationRequest:SimpleSignal;

        [Inject]
        public var showTipOnMapRequest:SimpleSignal;

		[Inject]
		public var tipSelected:SimpleSignal;

        public function AppEventsBus() {

        }
    }
}