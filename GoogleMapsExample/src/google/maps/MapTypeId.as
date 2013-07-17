package google.maps {

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 3:27 PM
 * To change this template use File | Settings | File Templates.
 */
[JavaScript(export="false",name="google.maps.MapTypeId")]
public class MapTypeId {

    public static const ROADMAP:String = "roadmap"; // displays the normal, default 2D tiles of Google Maps.
    public static const SATELLITE:String = "satellite"; // displays photographic tiles.
    public static const HYBRID:String ="hybrid";// displays a mix of photographic tiles and a tile layer for prominent features (roads, city names).
    public static const TERRAIN:String = "terrain";// displays physical relief tiles for displaying elevation and water features (mountains, rivers, etc.).

    public function MapTypeId() {
    }
}
}