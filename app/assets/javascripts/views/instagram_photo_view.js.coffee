class TrailerSwift.Views.InstagramPhotoView extends Backbone.View
  id: "info-window"
  
  initialize: ->
    @template = JST['instagram_photo_view']

    @render()

  render: ->
    # formattedDate = moment(@model.get('created_time')).format('M/D/YY')
    @$el.html @template
      photo: @model
      # formattedDate: formattedDate
