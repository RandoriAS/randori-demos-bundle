/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package commands {
import randori.signal.ISignal;

import robotlegs.flexo.command.ICommand;

import services.TipsService;

public class GetTipsCommand implements ICommand {

	[Inject]
	public var service:TipsService;

	public function execute():void {
		service.get();
	}
}
}