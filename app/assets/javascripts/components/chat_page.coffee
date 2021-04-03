class App.ChatPage extends App.UIComponent
  defaultContainerID: document

  _initVariables: ->
    @$messagesContainer = $('#messages')

  _initUI: =>
    @scrollToMessagesBottom()

  _initEventListeners: ->
    $('body').on 'keypress', '[data-behavior~=chat_speaker]', @onMessageSend

  onMessageSend: (event) =>
    # return if not ENTER or received an empty message
    return if (event.keyCode != 13) || (event.target.value.length < 1)

    App.chat.message(event.target.value)
    event.target.value = ''
    event.preventDefault()

    @scrollToMessagesBottom()

  scrollToMessagesBottom: ->
    # scroll to bottom of the messages container
    @$messagesContainer.animate({
      scrollTop: @$messagesContainer.prop('scrollHeight')
    }, 500);
