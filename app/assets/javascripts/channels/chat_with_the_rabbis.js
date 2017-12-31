App.chat_with_the_rabbis = App.cable.subscriptions.create("ChatWithTheRabbisChannel", {
  connected: function() {
    $('#chat-submit').click(this.sendChat.bind(this))
    $('#chat-input').on('keydown', (event) => {
      if (event.keyCode === 13) {
          App.chat_with_the_rabbis.sendChat()
      }
    })



  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    this.appendToChatConsole(data)
  },

  appendToChatConsole: function(data) {
      $('#chat-messages').append(`<div>${data.message}</div>`)
  },

  sendChat: function() {
    this.perform('sendMessage', {message: $('#chat-input').val()})
    $('#chat-input').val('')

  }
});
