class App.Search extends App.UIComponent

  _initVariables: ->
    @searchInputSelector = '.js-search-input'
    @$searchInput = @$container.find('.js-search-input')
    @searchBtnSelector = '.js-search-btn'

  _initEventListeners: ->
    $('body').on 'click', @searchBtnSelector, @onSearchBtnClick
    $('body').on 'keypress', @searchInputSelector, @onSearchInputKeyPress

  onSearchBtnClick: =>
    window.location = "/students?q=#{@$searchInput.val()}"
    @$searchInput.val(null)

  onSearchInputKeyPress: (e) =>
    @onSearchBtnClick() if e.keyCode == 13
