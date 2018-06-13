class ChatMessage < ApplicationRecord
  belongs_to :user

  def self.recent_messages(current_user)

    if current_user.admin?
      ChatMessage.order(created_at: :asc).last(15)
    else
      ChatMessage.where(user_id: current_user.id).order(created_at: :asc).last(10)
    end

  end


end
