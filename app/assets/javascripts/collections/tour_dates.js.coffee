TrailerSwift.Collections.TourDates = Backbone.Collection.extend
  model: TrailerSwift.Models.TourDate
  comparator: (tourDate)->
    new Date(tourDate.get('date'))
