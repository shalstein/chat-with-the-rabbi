class AdminChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chatsWithTheRabbis'
  end

  def unsubscribed
    stop_all_streams
  end


  def sendMessage(message)
    CreateChatMessageJob.perform_later(content: message['content'], user: current_user, recipient_id: message['for'])
      user = User.find(message['for'])
      ChatWithTheRabbisChannel.broadcast_to(user, content: message['content'], from: {id: current_user.id, name: current_user.name} )
      ActionCable.server.broadcast('chatsWithTheRabbis', content: message['content'], from: {id: current_user.id, name: current_user.name})
  end


end
