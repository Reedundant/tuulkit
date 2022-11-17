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
    let lng = this.markersValue[0].lng
    let lat = this.markersValue[0].lat

    console.log('longitude: ' + lng,'latitude: ' + lat)

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [lng, lat], // Initial view
      zoom: 10,
      projection: 'equalEarth'
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    // Sets bounds
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat])
    });

    // Fits to bounds
    this.map.fitBounds(bounds, {
      padding: 50,
      decoration: 150
    })
  }

  #addMarkersToMap() {
    // Checks markers value in index.html.erb
    this.markersValue.forEach((marker) => {
      // Create a new marker, set the longitude and latitude, and add it to the map.
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ]) // Pass iterated value here
        .addTo(this.map)
    })
  }
  // End of class
}
