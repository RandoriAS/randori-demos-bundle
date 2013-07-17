package google.maps {
import randori.webkit.html.HTMLElement;

/**
     * Created with IntelliJ IDEA.
     * User: mlabriola
     * Date: 4/11/13
     * Time: 3:31 PM
     * To change this template use File | Settings | File Templates.
     */
    [JavaScript(export="false",name="google.maps.Map")]
    public class Map {
        public function Map( element:HTMLElement, options:MapOptions ) {
        }

        public function setZoom( zoom:Number ):void{};
        public function setCenter( latlng:LatLng):void{};
        public function setOptions( options:MapOptions ):void{};
    }
}