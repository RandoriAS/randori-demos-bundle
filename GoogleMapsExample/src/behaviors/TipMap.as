/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package behaviors {
    import behaviors.tabs.MenuItem;

import google.maps.LatLng;
import google.maps.Map;
import google.maps.MapOptions;
import google.maps.MapTypeId;

import google.maps.Marker;

import randori.behaviors.AbstractBehavior;
import randori.webkit.html.HTMLElement;

import services.vo.Tip;


public class TipMap extends AbstractBehavior {

	private var map:Map;

	public function showTip( tip:Tip):void{
		var mapOptions:MapOptions = new MapOptions();
		mapOptions.center = new LatLng( tip.latitude, tip.longitude );
		mapOptions.zoom = 12;
		mapOptions.mapTypeId = MapTypeId.ROADMAP;
		map.setOptions( mapOptions );
	}

	public function resetMap():void{
		var mapOptions:MapOptions = new MapOptions();
		mapOptions.center = new LatLng(33.748893,-84.388046);
		mapOptions.zoom = 10;
		mapOptions.mapTypeId = MapTypeId.ROADMAP;

		map.setOptions(mapOptions);
	}

	public function showLocations( locations:Array ):void {
		var mapOptions:MapOptions = new MapOptions();
		mapOptions.center = new LatLng(33.748893,-84.388046);
		mapOptions.zoom = 10;
		mapOptions.mapTypeId = MapTypeId.ROADMAP;

		map = new Map( decoratedElement, mapOptions);

		for (var i:int = 0; i < locations.length; i++) {
			var location:Tip = locations[i] as Tip;
			var config:Object = new Object();
			config.title = location.name;
			config.position = new LatLng(location.latitude, location.longitude);
			config.map = map;
			var marker:Marker = new Marker( config );
		}
	}
}
}