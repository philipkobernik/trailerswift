$.extend(TrailerSwift.Support,
  initInfoWindow: ->
    TrailerSwift.infoWindow = new google.maps.InfoWindow
      content: 'uninitialized'

  placeTourDates: ->
    @placeTourDate tourDate for tourDate in TrailerSwift.tourDates.models

  placeTourDate: (tourDate)->

    marker = tourDate.get('marker')

    google.maps.event.addListener(marker, 'click', ->
      TrailerSwift.Support.loadInfoView tourDate
    )

  loadInfoView: (tourDate)->
    tourDateView = new TrailerSwift.Views.TourDateView
      model: tourDate

    TrailerSwift.infoWindow.setContent tourDateView.el
    TrailerSwift.infoWindow.open(TrailerSwift.map, tourDate.get('marker'))
    mixpanel.track('pop tour-date info window')

  latLngFrom: (location)->
    return new google.maps.LatLng(location.get('lat'), location.get('lng'))

  markerFrom: (location, title)->
    return new google.maps.Marker
      position: @latLngFrom(location)
      title: title
      map: TrailerSwift.map

  polyLineFromLocations: ->
    lineSymbol =
      path: 'M 0,-1 0,1',
      strokeOpacity: 0.9,
      scale: 4

    coords = TrailerSwift.locations.pluck('latLng')

    return new google.maps.Polyline
      path: coords
      #strokeColor: '#c52f24'
      strokeOpacity: 0.0
      #strokeWeight: 4
      icons: [
        icon: lineSymbol,
        offset: '0',
        repeat: '20px'
      ]

  imageMarker: (location, imagePath)->
    return new google.maps.Marker
      position: location.get('latLng')
      icon: imagePath
      map: TrailerSwift.map
)
