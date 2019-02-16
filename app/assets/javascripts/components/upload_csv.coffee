class App.UploadCsv extends App.UIComponent
  defaultContainerID: document

  _initVariables: ->
    @$openSpan = @$container.find('.js-wanna-upload')
    @$form = @$container.find('.js-wanna-upload-form')
    @$submit = @$container.find('.js-submit-upload-csv')

  _initEventListeners: =>
    @$openSpan.on 'click', =>
      @$form.toggleClass('hidden')
    @$submit.on 'click', =>
      @$form.toggleClass('hidden')
