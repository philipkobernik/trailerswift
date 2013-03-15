TrailerSwift.Views.App = Backbone.View.extend
  initialize: ->
    @render()
    google.maps.event.addDomListener(window, 'load', @render)

  render: ->
    TrailerSwift.vanPoly = TrailerSwift.Support.polyLineFromLocations()
    TrailerSwift.vanPath = TrailerSwift.vanPoly.getPath()
    TrailerSwift.vanPoly.setMap(TrailerSwift.map)

    vanImage = "/images/van.png"
    TrailerSwift.vanMarker = TrailerSwift.Support.imageMarker(TrailerSwift.locations.last(), vanImage)
    TrailerSwift.Support.placeTourDates()

    TrailerSwift.Support.initInfoWindow()
