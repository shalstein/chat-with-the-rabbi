class ChatWithTheRabbisChannel < ApplicationCable::Channel
  def subscribed
    if current_user.admin?  
     stream_from 'chatsWithTheRabbis'
    else
     stream_for current_user
    end
  end


  def unsubscribed
    stop_all_streams
  end


  def sendMessage(message)
    CreateChatMessageJob.perform_later(content: message['content'], user: current_user)
    ActionCable.server.broadcast('chatsWithTheRabbis', content: message['content'],from: {id: current_user.id, name: current_user.name})
    ChatWithTheRabbisChannel.broadcast_to(current_user, content: message['content'], from: {id: current_user.id, name: current_user.name} )
  end

end
