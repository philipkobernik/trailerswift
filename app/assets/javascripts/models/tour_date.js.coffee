TrailerSwift.Models.TourDate = Backbone.Model.extend
  initialize: ->
    @setLatLng()

  setLatLng: ->
    if !@has('lat') && !@has('lng')
      # needs to hit geocoder
      console.log "hitting geocoder"
      geocoder = new google.maps.Geocoder()
      #geocoder.geocode({address: @get('map_query')}, @onGeocode(resp, status))

  onGeocode: ->
