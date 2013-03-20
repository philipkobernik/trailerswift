TrailerSwift.Views.App = Backbone.View.extend
  initialize: ->
    @setElement $(document).find('ul.tour-dates')

    google.maps.event.addDomListener(window, 'load', @render)

  render: ->
    TrailerSwift.vanPoly = TrailerSwift.Support.polyLineFromLocations()
    TrailerSwift.vanPath = TrailerSwift.vanPoly.getPath()
    TrailerSwift.vanPoly.setMap(TrailerSwift.map)

    vanImage = "/images/van.png"
    TrailerSwift.vanMarker = TrailerSwift.Support.imageMarker(TrailerSwift.locations.last(), vanImage)
    TrailerSwift.Support.placeTourDates()

    TrailerSwift.Support.initInfoWindow()

    sideBarView = new TrailerSwift.Views.SideBarView
      collection: TrailerSwift.tourDates

    currentLocationView = new TrailerSwift.Views.userLocationView
      model: TrailerSwift.userLocation

    closestTourDateView = new TrailerSwift.Views.ClosestTourDate
      miles: TrailerSwift.closestTourDate[0]
      tourDate: TrailerSwift.tourDates.get(TrailerSwift.closestTourDate[1])

    #bounds = new google.maps.LatLngBounds()
    #bounds.extend(TrailerSwift.locations.last().get('latLng'))
    #bounds.extend(TrailerSwift.userLocation.get('latLng'))

    box = TrailerSwift.boundingBox
    sw = new google.maps.LatLng(box[0], box[1])
    ne =  new google.maps.LatLng(box[2], box[3])

    bounds = new google.maps.LatLngBounds sw, ne

    TrailerSwift.map.fitBounds bounds
