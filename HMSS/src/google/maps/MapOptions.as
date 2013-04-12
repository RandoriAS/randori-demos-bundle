package google.maps {

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 3:33 PM
 * To change this template use File | Settings | File Templates.
 */
[JavaScript(export="false",name="Object",mode="json")]
public class MapOptions {

    public var center:LatLng;
    public var mapTypeId:String;
    public var zoom:Number;

    public function MapOptions() {
    }
}
}