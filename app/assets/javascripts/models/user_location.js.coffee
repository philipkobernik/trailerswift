class TrailerSwift.Models.UserLocation extends Backbone.Model
  initialize: ->
    console.log "init user location"
    console.log @attributes
    if @has('lat') && @has('lng')
      @set 'latLng', TrailerSwift.Support.latLngFrom(@)
