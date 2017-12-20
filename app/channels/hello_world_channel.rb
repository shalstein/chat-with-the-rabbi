class HelloWorldChannel < ApplicationCable::Channel


  def subscribed
    
    stream_from "user"
  end
  def unsubscribed

  end
end
