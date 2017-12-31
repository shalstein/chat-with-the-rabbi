class ChatWithTheRabbisChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ChatWithTheRabbis'
  end



  def unsubscribed
    stop_all_streams
  end


  def sendMessage(message)
    ActionCable.server.broadcast('ChatWithTheRabbis', message)
  end
end
