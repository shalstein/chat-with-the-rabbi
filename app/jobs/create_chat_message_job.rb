class CreateChatMessageJob < ApplicationJob
  queue_as :default

  def perform(message_params)
    ChatMessage.create(message_params)
  end
end
