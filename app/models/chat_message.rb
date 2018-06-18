class ChatMessage < ApplicationRecord
  belongs_to :user
  #scope :recent_messages, -> {ChatMessage.all.order(created_at: :asc).last(10)  }

  def self.recent_messages(current_user)

    if current_user.admin?
      ChatMessage.order(created_at: :desc).limit(10).reverse
    else
      ChatMessage.where(user_id: current_user.id).order(created_at: :desc).limit(10).reverse
    end

  end

  def self.recent_users
    User.joins("INNER JOIN (
      SELECT chat_messages.* 
      FROM chat_messages 
      ORDER BY  chat_messages.created_at DESC 
      LIMIT 10
      )
      AS recent_chats 
      ON users.id = recent_chats.user_id" ).distinct.pluck(:name, :id)
  end



end
