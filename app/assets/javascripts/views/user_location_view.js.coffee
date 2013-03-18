class TrailerSwift.Views.userLocationView extends Backbone.View
  initialize: ->
    console.log 'init userLocationView'
    @render()

  render: ->
    if @model.has('latLng')
      @marker = TrailerSwift.Support.imageMarker @model, "/images/you_are_here.png"
    else
      console.log 'user_location data missing'

