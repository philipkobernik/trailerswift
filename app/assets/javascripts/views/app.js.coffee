TrailerSwift.Views.App = Backbone.View.extend
  initialize: ->
    @setElement $(document).find('ul.tour-dates')

    google.maps.event.addDomListener(window, 'load', @render)

  render: ->
    TrailerSwift.vanPoly = TrailerSwift.Support.polyLineFromLocations()
    TrailerSwift.vanPath = TrailerSwift.vanPoly.getPath()
    TrailerSwift.vanPoly.setMap(TrailerSwift.map)

    vanImage = "/images/van1.png"
    TrailerSwift.vanMarker = TrailerSwift.Support.imageMarker(TrailerSwift.locations.last(), vanImage)
    TrailerSwift.Support.placeTourDates()

    TrailerSwift.Support.initInfoWindow()

    sideBarView = new TrailerSwift.Views.SideBarView
      collection: TrailerSwift.tourDates

    TrailerSwift.tourDates.upcoming()[0].get('marker').setAnimation(google.maps.Animation.BOUNCE)

    #currentLocationView = new TrailerSwift.Views.userLocationView
      #model: TrailerSwift.userLocation

    #closestTourDateView = new TrailerSwift.Views.ClosestTourDate
      #miles: TrailerSwift.closestTourDate[0]
      #tourDate: TrailerSwift.tourDates.get(TrailerSwift.closestTourDate[1])

