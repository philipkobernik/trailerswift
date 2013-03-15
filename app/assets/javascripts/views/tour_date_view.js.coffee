class TrailerSwift.Views.TourDateView extends Backbone.View
  initialize: ->
    @template = JST['tour_date_view']

    @render()

  render: ->
    console.log @model
    @$el.html @template tourDate: @model
