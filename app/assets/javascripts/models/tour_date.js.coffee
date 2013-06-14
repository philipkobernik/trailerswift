class TrailerSwift.Models.TourDate extends Backbone.Model
  url: ->
    "/tour_dates/#{@get('id')}"
  initialize: ->
    @setLatLng()

    @set 'marker', @buildMarker()

  buildMarker: ->
    date = moment @get('date')
    date.add('days', 1)
    now = moment()

    if date > now
      marker = TrailerSwift.Support.markerFrom(@, @get('venue'))
    else
      marker = TrailerSwift.Support.imageMarker(@, '/images/green-check.png')

    return marker

  setLatLng: ->
    if !@has('lat') && !@has('lng')
      geocoder = new google.maps.Geocoder()
      geocoder.geocode({address: @get('map_query')}, @onGeocode)

    else
      @set
        latLng: TrailerSwift.Support.latLngFrom @

  onGeocode: (results, status) =>
    console.log "geocoding to do..."
    if status != google.maps.GeocoderStatus.OK
      return false


    location = results[0].geometry.location


    @set
      lat: location["jb"]
      lng: location["kb"]

    @unset "marker"
    @save
      success: console.log 'update model success!'
      error: console.log 'update model error!'

