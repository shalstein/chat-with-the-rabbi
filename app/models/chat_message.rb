class ChatMessage < ApplicationRecord
  belongs_to :user

  def self.recent_messages
    ChatMessage.order(created_at: :asc).last(15)
  end
end
