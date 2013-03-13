TrailerSwift.loadMap = (lat, lng)->

  console.log "gmap initializing"
  mapOptions =
    center: new google.maps.LatLng(lat, lng)
    zoom: 12
    mapTypeId: google.maps.MapTypeId.ROADMAP
    style: [
      {
        "stylers": [
          { "hue": "#1100ff" },
          { "saturation": 32 },
          { "weight": 1.5 },
          { "gamma": 2.7 }
        ]
      }
    ]

  TrailerSwift.map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
