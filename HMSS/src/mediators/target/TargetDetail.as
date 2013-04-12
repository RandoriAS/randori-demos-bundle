package mediators.target {
import eventBus.HMSSBus;

import randori.behaviors.AbstractMediator;
import randori.behaviors.template.TemplateRenderer;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.webkit.html.HTMLLinkElement;

import services.vo.Target;

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
public class TargetDetail extends AbstractMediator {

    [View]
    public var detail:TemplateRenderer;

    [View]
    public var backToList:JQuery;

    [Inject]
    public var bus:HMSSBus;

    private var linkNode:JQuery;
    private var target:Target;

    override public function setViewData(viewData:Object):void {
        target = viewData as Target;
        detail.data = target;
        var link:HTMLLinkElement = decoratedNode.find("[data-id='mapLink']")[0] as HTMLLinkElement;
        linkNode = JQueryStatic.J( link );
        linkNode.click( handleLocationClick );
    }

    private function handleLocationClick():void {
        bus.showTargetLocation.dispatch( target );
    }

    override protected function onRegister():void {
        backToList.click( handleBack );
    }

    override protected function onDeregister():void {
        backToList.off("click");
        linkNode.off("click");
    }

    private function handleBack( e:Event ):void {
        bus.targetClose.dispatch();
    }
}
}