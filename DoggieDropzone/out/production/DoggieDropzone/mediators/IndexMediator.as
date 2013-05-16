package mediators {
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;

/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 5/15/13
 * Time: 3:38 PM
 * To change this template use File | Settings | File Templates.
 */
	public class IndexMediator extends AbstractMediator {


		[View(required="true")]
		public var viewStack:ViewStack;

		override protected function onRegister():void {
			//viewStack.pushView("views/login.html");
			viewStack.pushView("views/selectdates.html");
			//
		}

		override protected function onDeregister():void {

		}

	}
}