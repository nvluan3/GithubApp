var _zoom;
var _Markers;
var _map;

var resp_location = function(strResult) {
	
	var point = L.latLng(0, 0);
	if (strResult.length == 0)
	{
		point.lng = 114.054324;
		point.lat = 22.555956;
	}
	else
	{
		var result = JSON.parse(strResult);	
		var lng = result.content.point.x;
		var lat = result.content.point.y;
		
		var gcj02towgs84 = coordtransform.gcj02towgs84(lng, lat);	
		point.lng = gcj02towgs84[0];
		point.lat = gcj02towgs84[1];
	}
	
	_map.panTo(point);
	_map.setView(point,_zoom);
	_Markers.setLatLng(point);
	window.getRequest.slot_osm_position(point.lng, point.lat);
};


L.GeoIP = L.extend({ centerMapOnPosition:function(map,Markers,zoom){				
		_map = map;
		_Markers = Markers;
		_zoom = zoom;
		return;	
	} 
});
