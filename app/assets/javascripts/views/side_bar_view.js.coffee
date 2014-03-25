class TrailerSwift.Views.SideBarView extends Backbone.View
  initialize: ->
    @setElement $(document).find('.sidebar-nav')
    @render()

  events:
    "click a.tour-date" : "onClick"

  render: ->
    _.each(@collection.models, (model)=>
      tourDateMoment = moment(model.get('date'))
      formattedDate = tourDateMoment.format('M/D')

      view = JST['side_bar_date']
        tourDate: model
        formattedDate: formattedDate

      tourDateMoment.add 'days', 1 # adjusting threshhold for a show tonight

      if tourDateMoment > moment() # compare to 'now'
        @$el.find('ul.upcoming li.tour-dates-header').after view
      else
        @$el.find('ul.past li.tour-dates-header').after view
    )

  onClick: (event)->
    event.preventDefault()
    TrailerSwift.e = $(event.target)
    tourDateId = $(event.target).data('tour-date-id')

    tourDate = TrailerSwift.tourDates.get(tourDateId)

    TrailerSwift.Support.loadInfoView tourDate

