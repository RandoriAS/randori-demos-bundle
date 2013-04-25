package services.vo {
    /**
     * Created with IntelliJ IDEA.
     * User: leifwells
     * Date: 4/23/13
     * Time: 10:05 PM
     * To change this template use File | Settings | File Templates.
     */
    [JavaScript(export="false",name="Object",mode="json")]
    public class Tip {
        public var name:String;
        public var address:String;
        public var description:String;
        public var comments:String;
        public var latitude:String;
        public var longitude:String;

        public function Tip() {


        }
    }
}