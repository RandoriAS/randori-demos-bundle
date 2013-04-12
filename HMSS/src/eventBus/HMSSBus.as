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

    public var targetSelected:SimpleSignal;
    public var targetClose:SimpleSignal;
    public var showTargetLocation:SimpleSignal;
    public var showAllTargetLocations:SimpleSignal;

    public function HMSSBus() {
        this.targetSelected = new SimpleSignal();
        this.targetClose = new SimpleSignal();
        this.showTargetLocation = new SimpleSignal();
        this.showAllTargetLocations = new SimpleSignal();
    }
}
}