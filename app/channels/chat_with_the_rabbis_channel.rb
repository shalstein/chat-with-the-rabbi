class ChatWithTheRabbisChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ChatWithTheRabbis'
  end



  def unsubscribed
    stop_all_streams
  end


  def sendMessage(message)
    CreateChatMessageJob.perform_later(content: message['content'], user: current_user)
    ActionCable.server.broadcast('ChatWithTheRabbis', content: message['content'], username: current_user.name)
  end
end
