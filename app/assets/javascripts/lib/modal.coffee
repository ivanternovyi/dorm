class App.Modal
  constructor: ->
    $('.js-modal-close').on 'click', =>
      @close()
    $('[data-modal]').on 'click', @open

  open: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    $modal = $("##{$target.data('modal')}")

    if $modal.length
      $('body').addClass('-modal-opened')
      $modal.addClass('opened')

  close: ($element) ->
    if typeof $element != 'undefined'
      $element.removeClass('opened')
      if !$('.js-modal').hasClass('opened')
        $('body').removeClass('-modal-opened')
    else
      $('.js-modal').removeClass('opened')
      $('body').removeClass('-modal-opened')

