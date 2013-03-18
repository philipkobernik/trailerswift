class TrailerSwift.Views.SideBarView extends Backbone.View
  #tagName: 'ul'
  #className: '.nav.nav-list'

  initialize: ->
    @setElement $(document).find('ul.nav.nav-list.tour-dates')
    @render()

  events:
    "click a" : "onClick"

  render: ->
    models = @collection.upcoming()
    _.each(models, (model)=>
      view = JST['side_bar_date'] tourDate: model
      @$el.append view
    )

  onClick: (event)->
    event.preventDefault()
    TrailerSwift.e = $(event.target)
    tourDateId = $(event.target).data('tour-date-id')
    console.log tourDateId

    tourDate = TrailerSwift.tourDates.get(tourDateId)

    TrailerSwift.Support.loadInfoView tourDate


