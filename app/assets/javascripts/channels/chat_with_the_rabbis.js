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
      const chatMessages = $('#chat-messages')
      chatMessages.scrollTop(chatMessages[0].scrollHeight)  
  },

  sendChat: function() {
    const chatDropdown = $('#chat-dropdown')
    const recipentId = chatDropdown.val()
    const chatInputElement = $('#chat-input')
    const chatInputValue = chatInputElement.val()
    const isAdmin = chatDropdown.length > 0
    
    if (chatInputValue.replace(/\s/g, '').length > 0) {
      if(isAdmin){
        if (recipentId){
          $('#error_explanation').remove()
          $('.field_with_errors > #chat-dropdown').unwrap()
          this.perform('sendMessage', {content: chatInputValue, for: chatDropdown.val() })
          chatInputElement.val('')
        }
        else {
          chatDropdown.before("<div id='error_explanation'> Recipent Must Be Selected </div>")
          chatDropdown.wrap("<div class='field_with_errors'></di>")
          }
        }
      else {
        this.perform('sendMessage', {content: chatInputValue })
        chatInputElement.val('')
      }
    }

    

  }

});



