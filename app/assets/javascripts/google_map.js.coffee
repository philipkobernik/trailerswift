TrailerSwift.loadMap = (lat, lng)->

  mapOptions =
    center: new google.maps.LatLng(lat, lng)
    zoom: 5
    mapTypeId: google.maps.MapTypeId.ROADMAP

  # google.maps.visualRefresh = true
  TrailerSwift.map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
