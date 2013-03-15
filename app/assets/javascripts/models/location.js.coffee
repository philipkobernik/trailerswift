TrailerSwift.Models.Location = Backbone.Model.extend
  initialize: (options)->
    console.log "initializing location #{@get('reverse')}"
    @setLatLng()

  setLatLng: ->
    @set('latLng', TrailerSwift.Support.latLngFrom(@))

  setMarker: ->
    console.log 'setting marker'
    @set('marker', TrailerSwift.Support.markerFrom(@, @get('reverse')))

  showMarker: ->
    if @has('marker') == false
      @setMarker()
    else
      @get('marker').setMap(TrailerSwift.map)

  hideMarker: ->
    if @has('marker') == true
      @get('marker').setMap(null)

