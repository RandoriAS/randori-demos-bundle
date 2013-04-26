package mediators.target {
	import eventBus.HMSSBus;

	import google.maps.LatLng;
	import google.maps.Map;
	import google.maps.MapOptions;
	import google.maps.Marker;

	import randori.behaviors.AbstractMediator;
	import randori.jquery.Event;
	import randori.jquery.JQuery;
	import randori.webkit.html.HTMLElement;

	import services.vo.Target;

	/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
public class TargetLocation extends AbstractMediator {

    [View]
    public var backToTarget:JQuery;

    [View]
    public var map:JQuery;

    [Inject]
    public var bus:HMSSBus;

    private var target:Target;

    override public function setViewData(viewData:Object):void {
        target = viewData as Target;
        showMap( target );
    }

    private function handleLocationClick():void {
        bus.showTargetLocation.dispatch( target );
    }

    override protected function onRegister():void {
        backToTarget.click( handleBack );
    }

    override protected function onDeregister():void {
        backToTarget.off("click");
    }

    private function showMap( target:Target ):void {
        var mapOptions:MapOptions = new MapOptions();
        mapOptions.center = new LatLng(target.latitude, target.longitude);

        if ( target.latitude && target.longitude ) {
            mapOptions.zoom = 16;
        } else {
            mapOptions.zoom = 1;
        }
        mapOptions.mapTypeId = "satellite"; //MapTypeId.ROADMAP;


        var newMap:Map = new Map(map[0] as HTMLElement, mapOptions);
        newMap.setTilt(45);

        if ( target.latitude && target.longitude ) {
            var config:Object = new Object();
            config.position = newMap.getCenter();
            config.map = newMap;
            config.title = "Last known Location";

            var marker:Marker = new Marker( config );
        }

    }

    public function handleBack( e:Event ):void {
        bus.targetClose.dispatch();
    }
}
}