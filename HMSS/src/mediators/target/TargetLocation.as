package mediators.target {
import eventBus.HMSSBus;

import google.maps.LatLng;
import google.maps.Map;
import google.maps.MapOptions;
import google.maps.MapTypeId;

import randori.behaviors.AbstractMediator;
import randori.behaviors.template.TemplateRenderer;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.webkit.html.HTMLElement;
import randori.webkit.html.HTMLLinkElement;

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
        mapOptions.zoom = 8;
        mapOptions.mapTypeId = "roadmap"; //MapTypeId.ROADMAP;

        var newMap:Map = new Map(map[0] as HTMLElement, mapOptions);
    }

    private function handleBack( e:Event ):void {
        bus.targetClose.dispatch();
    }
}
}