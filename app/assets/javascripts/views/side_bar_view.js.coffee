class TrailerSwift.Views.SideBarView extends Backbone.View
  initialize: ->
    @setElement $(document).find('ul.nav.nav-list.tour-dates')
    @render()

  events:
    "click a" : "onClick"

  render: ->
    models = @collection.upcoming()
    _.each(models, (model)=>
      formattedDate = moment(model.get('date')).format('M/D')
      view = JST['side_bar_date']
        tourDate: model
        formattedDate: formattedDate

      @$el.find('li.tour-dates-header').after view
    )

  onClick: (event)->
    event.preventDefault()
    TrailerSwift.e = $(event.target)
    tourDateId = $(event.target).data('tour-date-id')

    tourDate = TrailerSwift.tourDates.get(tourDateId)

    TrailerSwift.Support.loadInfoView tourDate


