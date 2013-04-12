/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:09 AM
 * To change this template use File | Settings | File Templates.
 */
package behaviors.tabs {
    [JavaScript(export="false",name="Object",mode="json")]
    public class MenuItem {
        public var name:String;
        public var url:String;
        public var isRedirect:Boolean;

        public function MenuItem( name:String, url:String, isRedirect:Boolean=true ) {
            this.name = name;
            this.url = url;
            this.isRedirect = isRedirect;
        }
    }
}