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

  appendToChatConsole: function(message) {
      $('#chat-messages').append(`<span id=${message.from.id}>${message.from.name}: ${message.content}</span><br/>`)
  },

  sendChat: function() {

    var chatInput = $('#chat-input').val()
    if (chatInput.replace(/\s/g, '').length > 0) {
    this.perform('sendMessage', {content: chatInput, for: $('#chat-dropdown').val() })
  }
    $('#chat-input').val('')

  }

});



