class TrailerSwift.Views.TourDateView extends Backbone.View
  id: 'info-window'
  initialize: ->
    @template = JST['tour_date_view']

    @render()

  render: ->
    formattedDate = moment(@model.get('date')).format('M/D/YY')
    @$el.html @template
      tourDate: @model
      formattedDate: formattedDate
