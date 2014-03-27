TrailerSwift.Collections.TourDates = Backbone.Collection.extend
  model: TrailerSwift.Models.TourDate

  upcoming: ->
    now = moment()
    return _.filter(@models, (tourDate)->
      showDate = moment(new Date(tourDate.get('date')))
      showDate.add 'days', 1
      return showDate > now
    )
