App.admin_chat = App.cable.subscriptions.create("AdminChatChannel", {
  connected: function() {
    $('#chat-submit').click(this.sendChat.bind(this))
    $('#chat-input').on('keydown', (event) => {
      if (event.keyCode === 13) {
          App.admin_chat.sendChat()
      }
    })



  },

  disconnected: function() {

  },

  received: function(data) {
    this.appendToChatConsole(data)
  },

  appendToChatConsole: function(message) {
      $('#chat-messages').append(`<span id=${message.from.id}>${message.from.name}: ${message.content}</span><br/>`)   
      const newUser =  !$('#chat-dropdown').children().is((i , option) => option.value === message.from.id.toString())
      
      if (newUser){
          $('#chat-dropdown').append($('<option>', {
          value: message.from.id,
          text: message.from.name
        }))
      }   


  },

  sendChat: function() {

    var chatInput = $('#chat-input').val()
    if (chatInput.replace(/\s/g, '').length > 0) {
    this.perform('sendMessage', {content: chatInput, for: $('#chat-dropdown').val() })
  }
    $('#chat-input').val('')

  }

});

