$.extend(TrailerSwift.Support,
  placeInstagramPhotos: ->
    @placeInstagramPhoto photo for photo in TrailerSwift.instagramPhotos.models

  placeInstagramPhoto: (photo)->
    marker = photo.get('marker')

    google.maps.event.addListener(marker, 'click', ->
      TrailerSwift.Support.loadPhotoInfoView photo
    )

  initInfoWindow: ->
    TrailerSwift.infoWindow = new google.maps.InfoWindow
      content: 'uninitialized'
      maxWidth: 340

  placeTourDates: ->
    @placeTourDate tourDate for tourDate in TrailerSwift.tourDates.models

  placeTourDate: (tourDate)->

    marker = tourDate.get('marker')

    google.maps.event.addListener(marker, 'click', ->
      TrailerSwift.Support.loadInfoView tourDate
    )

  loadPhotoInfoView: (model)->
    constructor = TrailerSwift.Views.InstagramPhotoView
    view = new constructor
      model: model

    TrailerSwift.infoWindow.setContent view.el
    TrailerSwift.infoWindow.open(TrailerSwift.map, model.get('marker'))

    mixpanel.track('pop photo info window', photoId: model.get('instagram_id'))

  loadInfoView: (tourDate)->
    tourDateView = new TrailerSwift.Views.TourDateView
      model: tourDate

    TrailerSwift.infoWindow.setContent tourDateView.el
    TrailerSwift.infoWindow.open(TrailerSwift.map, tourDate.get('marker'))
    console.log('pop tour-date info window', {'tour-date': tourDate.toString()})
    mixpanel.track('pop tour-date info window',
      'tour-date': tourDate.toString()
      )
    mixpanel.track_links('a.purchase', 'clicked purchase-ticket link');
    mixpanel.track_links('a.facebook', 'clicked facebook event link');

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

  imageMarker: (location, imagePath, iconOptions={})->
    icon = _.extend({}, iconOptions, url: imagePath)

    return new google.maps.Marker
      position: location.get('latLng')
      icon: icon
      map: TrailerSwift.map
)
