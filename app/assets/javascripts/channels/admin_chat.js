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
      const chatMessages = $('#chat-messages')
      chatMessages.scrollTop(chatMessages[0].scrollHeight)  
      const newUser =  !$('#chat-dropdown').children().is((i , option) => option.value === message.from.id.toString())
      
      if (newUser){
          $('#chat-dropdown').append($('<option>', {
          value: message.from.id,
          text: message.from.name
        }))
      }   


  },

  sendChat: function() {
    const chatDropdown = $('#chat-dropdown')
    const recipentId = chatDropdown.val()
    var chatInput = $('#chat-input').val()
    if (chatInput.replace(/\s/g, '').length > 0 ) {
      if(recipentId){
        $('#error_explanation').remove()
        $('.field_with_errors > #chat-dropdown').unwrap()

        this.perform('sendMessage', {content: chatInput, for: $('#chat-dropdown').val() })
        $('#chat-input').val('')
      }
      else {
        chatDropdown.before("<div id='error_explanation'> Recipent Must Be Selected </div>")
        chatDropdown.wrap("<div class='field_with_errors'></di>")
      }

    }

  }

});



