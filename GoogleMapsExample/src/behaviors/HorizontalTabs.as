/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package behaviors {
    import behaviors.tabs.MenuItem;

    import randori.behaviors.List;
    import randori.dom.DomWalker;
    import randori.jquery.JQuery;
    import randori.signal.SimpleSignal;

    public class HorizontalTabs extends List {

        [Inject]
        public var menuItemSelected:SimpleSignal;

        override public function renderList():void  {
            super.renderList();

            var children:JQuery = decoratedNode.children();
            var first:JQuery = children.eq( 0 );
            var last:JQuery = children.eq(children.length-1);

            first.addClass( "first" );
            last.addClass("last");

            selectedIndex = 0;
        }

        override public function initialize():void  {
            this.listChanged.add( listChangedHandler );
            super.initialize();
        }

        private function listChangedHandler( index:int, data:Object ):void {
            if (data != null) {
                menuItemSelected.dispatch(data as MenuItem);
            }
        }

        public function HorizontalTabs(walker:DomWalker) {
            super(walker);

        }
    }
}