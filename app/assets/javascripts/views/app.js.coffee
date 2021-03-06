class TrailerSwift.Views.App extends Backbone.View
  initialize: ->
    @setElement $(document).find('ul.tour-dates')

    sideBarView = new TrailerSwift.Views.SideBarView
      collection: TrailerSwift.tourDates

    google.maps.event.addDomListener(window, 'load', @render)

  render: =>
    console.log 'window load event fired. running views.app.render()'
    TrailerSwift.Support.initInfoWindow()

    TrailerSwift.Support.placeInstagramPhotos()

    TrailerSwift.Support.placeTourDates()

    firstUpcomingDate = TrailerSwift.tourDates.upcoming()[0]
    if firstUpcomingDate?
      firstUpcomingDate.get('marker').setAnimation(google.maps.Animation.BOUNCE)

    return true if TrailerSwift.locations.length < 2

    TrailerSwift.vanPoly = TrailerSwift.Support.polyLineFromLocations()
    TrailerSwift.vanPath = TrailerSwift.vanPoly.getPath()
    TrailerSwift.vanPoly.setMap(TrailerSwift.map)

    @buildVanMarker()

    #currentLocationView = new TrailerSwift.Views.userLocationView
      #model: TrailerSwift.userLocation

    #closestTourDateView = new TrailerSwift.Views.ClosestTourDate
      #miles: TrailerSwift.closestTourDate[0]
      #tourDate: TrailerSwift.tourDates.get(TrailerSwift.closestTourDate[1])

  buildVanMarker: ->
    if @headingWest()
      vanImage = "/images/van-west.png"
    else
      vanImage = "/images/van-east.png"

    TrailerSwift.vanMarker = TrailerSwift.Support.imageMarker(TrailerSwift.locations.last(), vanImage)

  headingWest: ->
    return true if TrailerSwift.locations.length < 2

    nowLocation = TrailerSwift.locations.slice(-1)[0]
    lastLocation = TrailerSwift.locations.slice(-2, -1)[0]

    return nowLocation.get('lng') < lastLocation.get('lng')
