package contexts {
import eventbus.AppEventsBus;

import guice.GuiceModule;
import guice.binding.Binder;
import guice.binding.Scope;

/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 3:22 PM
 * To change this template use File | Settings | File Templates.
 */
public class ExampleContext extends GuiceModule {

    override public function configure(binder:Binder):void {
        binder.bind( AppEventsBus ).inScope( Scope.Singleton).to( AppEventsBus );
    }

    public function ExampleContext() {
        super();
    }
}
}