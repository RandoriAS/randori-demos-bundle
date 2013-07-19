/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package commands.signals {
import randori.signal.ISignal;

import services.vo.Tip;

public interface ITipSelected extends ISignal {
	function dispatch( tip:Tip ):void;
}
}