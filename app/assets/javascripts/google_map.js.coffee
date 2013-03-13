TrailerSwift.loadMap = (lat, lng)->

  console.log "gmap initializing"
  mapOptions =
    center: new google.maps.LatLng(lat, lng)
    zoom: 12
    mapTypeId: google.maps.MapTypeId.ROADMAP

  TrailerSwift.map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
