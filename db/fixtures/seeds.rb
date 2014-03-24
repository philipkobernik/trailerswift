User.seed(:id,
  { :email => 'jon@example.com',   :band_name => 'The Head And The Heart', :band_slug => 'the-head-and-the-heart'},
  { :email => 'emily@example.com', :band_name => 'TacocaT', :band_slug => "tacocat" }
)

jon = User.find_by_email 'jon@example.com'

Tour.seed(:id,
  { user_id: jon.id, name: "HH Tour!" }
)

hath_tour = Tour.find_by_name "HH Tour!"

TourDate.seed(:id,
  { tour_id: hath_tour.id, date: Date.today+21.weeks, city_state: "Portland, OR", venue: "Doug Fir", map_query: "Blah", ticket_url: "http://www.example.com", facebook_url: "http://www.example.com", lat: 45.522896, lng: -122.656997 },
  { tour_id: hath_tour.id, date: Date.today+22.weeks, city_state: "San Francisco, CA", venue: "Great American Music Hall", map_query: "Blah", ticket_url: "http://www.example.com", facebook_url: "http://www.example.com", lat: 37.784998, lng: -122.418851 }
)

Location.seed(:id,
  { tour_id: hath_tour.id, lat: 50.879953, lng: -113.965510, located_at: Date.today-2.day },
  { tour_id: hath_tour.id, lat: 49.1943005, lng: -113.313067, located_at: Date.today-1.day }
)


