package eventBus {
import randori.signal.SimpleSignal;

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 1:42 PM
 * To change this template use File | Settings | File Templates.
 */
public class HMSSBus {

    [Inject]
    public var targetSelected:SimpleSignal;

    [Inject]
    public var targetClose:SimpleSignal;

    [Inject]
    public var showTargetLocation:SimpleSignal;

    [Inject]
    public var showAllTargetLocations:SimpleSignal;

    public function HMSSBus() {
    }
}
}