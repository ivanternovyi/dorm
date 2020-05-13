window.App ||= {}

App.init = ->
  new App.UploadCsv
  new App.Search(container: $('.js-search'))
  new App.Modal

$(document).on 'turbolinks:load', ->
  App.init()
