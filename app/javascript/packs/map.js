import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  let markers = JSON.parse(mapElement.dataset.markers);
  navigator.geolocation.getCurrentPosition((position) => {
    const pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    markers.push(pos)
    map.addMarkers(markers);
    map.drawRoute({
      origin: [pos['lat'], pos['lng']],
      destination: [markers[0]['lat'], markers[0]['lng']],
      travelMode: 'driving',
      strokeColor: '#131540',
      strokeOpacity: 0.6,
      strokeWeight: 6
    });
    map.fitLatLngBounds(markers);
  });
}
