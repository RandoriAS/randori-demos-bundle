package mediators {
    import randori.behaviors.AbstractMediator;
    import randori.content.ContentLoader;
    import randori.jquery.Event;
    import randori.jquery.JQuery;
    import randori.jquery.JQueryStatic;
    import randori.webkit.dom.Element;
import randori.webkit.page.Window;

/**
     * Created with IntelliJ IDEA.
     * User: mlabriola
     * Date: 4/14/13
     * Time: 8:41 PM
     * To change this template use File | Settings | File Templates.
     */
    public class ExternalPageMediator extends AbstractMediator {

        [View]
        public var externalContentDiv:JQuery;

        [Inject]
        public var contentLoader:ContentLoader;

        override public function setViewData(viewData:Object):void {
            var contentURL:String = viewData as String;

            contentLoader.asynchronousLoad( contentURL).then( showContent );
        }

        private function showContent( externalPage:String ):void {
            externalContentDiv.html( externalPage );
            var links:JQuery = externalContentDiv.find('a'); //finds all <a/> tags

            for ( var i:int=0; i<links.length; i++ ) {
                var link:JQuery = JQueryStatic.J( links[i] );
                var existingHref:String = link.attr("href");
                link.attr( "href", "#" );
                link.data("href", existingHref );
                //link.removeAttr("target");
                link.click( clickHandler );
            }
        }

        private function clickHandler( event:Event ):void {
            var element:Element = event.currentTarget;
            var link:JQuery = JQueryStatic.J( element );
            var href:String = link.data("href") as String;

            //Window.console.log('NEW PAGE HIT');
            Window.open(href, '_blank' );
        }

        override protected function onRegister():void {

        }
    }
}