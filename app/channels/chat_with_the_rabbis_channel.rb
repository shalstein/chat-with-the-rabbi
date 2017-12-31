class ChatWithTheRabbisChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'ChatWithTheRabbis'
  #  stream_from 'Chatneat'



  end



  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end


  def sendMessage(message)
    ActionCable.server.broadcast('ChatWithTheRabbis', message)
  end
end
