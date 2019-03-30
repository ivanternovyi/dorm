class App.Search extends App.UIComponent

  _initVariables: ->
    @$searchInput = @$container.find('.js-search-input')
    @searchBtnSelector = '.js-search-btn'

  _initEventListeners: ->
    $('body').on 'click', @searchBtnSelector, @onSearchBtnClick

  onSearchBtnClick: =>
    window.location = "/students?q=#{@$searchInput.val()}"
    @$searchInput.val(null)
