class TrailerSwift.Models.InstagramPhoto extends Backbone.Model
  initialize: (options)->
    console.log "initializing instagram photo"
    @setLatLng()
    @set 'marker', @buildMarker()

  buildMarker: ->
    TrailerSwift.Support.imageMarker(@, @get('img_url_thumb'), scaledSize: new google.maps.Size(40, 40))

  setLatLng: ->
    @set latLng: TrailerSwift.Support.latLngFrom @
