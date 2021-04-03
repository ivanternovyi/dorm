App.chat = App.cable.subscriptions.create({ channel: 'ChatChannel' }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    document.getElementById('messages').insertAdjacentHTML('beforeend', data['content']);
  },

  message(content) {
    this.perform('message', { content: content });
  }
})
