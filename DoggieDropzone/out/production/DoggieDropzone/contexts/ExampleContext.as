package contexts {
import guice.GuiceModule;
import guice.binding.Binder;

/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 5/15/13
 * Time: 3:36 PM
 * To change this template use File | Settings | File Templates.
 */
	public class ExampleContext extends GuiceModule {

		override public function configure(binder:Binder):void {
		}

		public function ExampleContext() {
			super();
		}
	}
}