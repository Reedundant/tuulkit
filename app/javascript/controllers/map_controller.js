import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    // console.log('🟢 connected to stimulus!')
    mapboxgl.accessToken = this.apiKeyValue

    // Creates new object of map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [-74.5, 40], // Initial view
      zoom: 9,
      projection: 'globe'
    });

    this.#addMarkersToMap();
  }

  #addMarkersToMap() {
    // Checks markers value in index.html.erb
    this.markersValue.forEach((marker) => {
      console.log(marker);
      // Create a new marker, set the longitude and latitude, and add it to the map.
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ]) // Pass iterated value here
        .addTo(this.map)
    })
  }
  // End of class
}
