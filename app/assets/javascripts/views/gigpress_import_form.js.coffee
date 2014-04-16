class TrailerSwift.Views.GigpressImportForm extends Backbone.View
  events:
    'change input#gigpress_file' : 'onSelectFile'

  onSelectFile: (e)->
    @$('input[type="submit"]')
      .removeClass('disabled')
      .removeClass('btn-default')
      .addClass('btn-success')

