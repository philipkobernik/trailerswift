class TrailerSwift.Views.TourDateView extends Backbone.View
  initialize: ->
    @template = JST['tour_date_view']

    @render()

  render: ->
    formattedDate = moment(new Date(@model.get('date'))).format('M/D/YY')
    @$el.html @template
      tourDate: @model
      formattedDate: formattedDate
