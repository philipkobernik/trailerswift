class TrailerSwift.Models.TourDate extends Backbone.Model
  url: ->
    "/tour_dates/#{@get('id')}"
  initialize: ->
    @setLatLng()

    date = moment @get('date')
    now = moment()
    if date > now
      marker = TrailerSwift.Support.markerFrom(@, @get('venue'))
    else
      marker = TrailerSwift.Support.imageMarker(@, '/images/green-check.png')

    @set 'marker', marker

  setLatLng: ->
    if !@has('lat') && !@has('lng')
      console.log "hitting geocoder"
      geocoder = new google.maps.Geocoder()
      geocoder.geocode({address: @get('map_query')}, @onGeocode)

    else
      console.log "date already has lat/lng"
      @set
        latLng: TrailerSwift.Support.latLngFrom @

  onGeocode: (results, status) =>
    if status != google.maps.GeocoderStatus.OK
      return false

    console.log 'in (asynch) onGeocode'

    location = results[0].geometry.location
    console.log "saving location..."


    @set
      lat: location.mb
      lng: location.nb
    console.log "#{@get('venue')} is at #{@get('lat')} , #{@get('lng')}"

    @save()

    @set
      latLng: location
