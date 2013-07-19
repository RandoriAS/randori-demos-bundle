/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package commands.signals {
import randori.signal.ISignal;

public interface ITabsModelUpdated extends ISignal {
	function dispatch( tabs:Array ):void;
}
}