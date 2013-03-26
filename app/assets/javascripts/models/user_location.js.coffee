class TrailerSwift.Models.UserLocation extends Backbone.Model
  initialize: ->
    if @has('lat') && @has('lng')
      @set 'latLng', TrailerSwift.Support.latLngFrom(@)
