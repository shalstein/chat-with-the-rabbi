App.chat_with_the_rabbis = App.cable.subscriptions.create("ChatWithTheRabbisChannel", {
  connected: function() {
    this.addSendEventListeners()
    $('#chat-submit').click(this.sendChat.bind(this))

    // Called when the subscription is ready for use on the server

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

  addSendEventListeners: () => {
    $('#chat-input').on('keydown', (event) => {
      if (event.keyCode === 13) {
        console.log('gi fix me')
        //this.sendChat()
      }
    })
    $('#chat-submit').click(this.sendChat)
  },

  sendChat: function() {
    console.log(this)
    this.perform('sendMessage', {message: $('#chat-input').val()})
    $('#chat-input').val('')

  }
});
