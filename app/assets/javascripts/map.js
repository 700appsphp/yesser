mapStyle = [
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#193341"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#2c5a71"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#29768a"
            },
            {
                "lightness": -37
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#406d80"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#406d80"
            }
        ]
    },
    {
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#3e606f"
            },
            {
                "weight": 2
            },
            {
                "gamma": 0.84
            }
        ]
    },
    {
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry",
        "stylers": [
            {
                "weight": 0.6
            },
            {
                "color": "#1a3541"
            }
        ]
    },
    {
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#2c5a71"
            }
        ]
    }
]

var markersArray = [];

function setMarker (handler, longitude, latitude) {
  var marker = handler.addMarker({lat: longitude, lng: latitude});
  handler.bounds.extendWith(marker);
  return marker;
}

function setMapOn(id, longitude, latitude, latitude_id, longitude_id, callback) {
  var handler = Gmaps.build('Google');
  handler.buildMap({
    internal: {id: 'map'},
    provider: {
      zoom:      7,
      center:    new google.maps.LatLng(24.711667, 46.724167),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles:    mapStyle
    },
  },function (){
    if (longitude && latitude) {
      var marker = setMarker(handler, longitude, latitude);
      handler.fitMapToBounds();
      markersArray.push(marker);
      handler.getMap().setZoom(7);
    };
    if (typeof callback === "function") {
      callback(handler, latitude_id, longitude_id);
    }
  });
  return handler;
}

function updateMarkerOnClick (handler, latitude_id, longitude_id) {
  var map = handler.getMap();
  google.maps.event.clearInstanceListeners(map, 'click');

  google.maps.event.addListener(map, 'click', function (object) {
    var position = object.latLng;
    handler.removeMarkers(markersArray);
    markersArray = []
    var marker = setMarker(handler, position["d"], position["e"]);
    markersArray.push(marker);
    $('#' + latitude_id).val(position["d"]);
    $('#' + longitude_id).val(position["e"]);
  });
}

function updateMap (handler, latitude_id, longitude_id) {
  var latitude = $('#' + latitude_id).val();
  var longitude = $('#' + longitude_id).val();

  handler.removeMarkers(markersArray);
  markersArray = []
  var marker = setMarker(handler, latitude, longitude);
  markersArray.push(marker);
}
