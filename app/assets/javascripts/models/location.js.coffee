TrailerSwift.Models.Location = Backbone.Model.extend
  initialize: (options)->
    @setLatLng()

  setLatLng: ->
    @set('latLng', TrailerSwift.Support.latLngFrom(@))

  setMarker: ->
    @set('marker', TrailerSwift.Support.markerFrom(@, @get('reverse')))

  showMarker: ->
    if @has('marker') == false
      @setMarker()
    else
      @get('marker').setMap(TrailerSwift.map)

  hideMarker: ->
    if @has('marker') == true
      @get('marker').setMap(null)

