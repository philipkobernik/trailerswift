class TrailerSwift.Views.ClosestTourDate extends Backbone.View
  initialize: (options)->
    @tourDate = options.tourDate
    @render()

  render: ->

    lineSymbol =
      path: 'M 0,-1 0,1',
      strokeOpacity: 0.5,
      scale: 3

    coords = [TrailerSwift.userLocation.get('latLng'), @tourDate.get('latLng')]

    polyLine = new google.maps.Polyline
      path: coords
      #strokeColor: '#c52f24'
      strokeOpacity: 0.0
      #strokeWeight: 4
      icons: [
        icon: lineSymbol,
        offset: '0',
        repeat: '20px'
      ]

    polyLine.setMap(TrailerSwift.map)
