package mediators {
import eventbus.AppEventsBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.List;
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
        public var service:TipsService;

		[Inject]
		public var bus:AppEventsBus;

        [View]
        public var tipsList:List;

        override protected function onRegister():void {
	        tipsList.listChanged.add( handleTipSelected );
            service.get().then( handleServiceResult, handleServiceError );
        }

        private function handleServiceResult( result:Array ):void{
            tipsList.data = result;
        }

		private function handleServiceError( error:Object ):void{
			Window.console.log( error );
		}

        private function handleTipSelected( thing:* ):void {
	        Window.console.log( 'Selected: ' +  tipsList.selectedItem.name );
	        bus.tipSelected.dispatch(tipsList.selectedItem );
        }
    }
}