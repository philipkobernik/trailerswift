$.extend(TrailerSwift.Support,

  latLngFrom: (location)->
    return new google.maps.LatLng(location.get('lat'), location.get('lng'))

  markerFrom: (location)->
    return new google.maps.Marker
      position: @latLngFrom(location)
      title: location.get('reverse')
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
