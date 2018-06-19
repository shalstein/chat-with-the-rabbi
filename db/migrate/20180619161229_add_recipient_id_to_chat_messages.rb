class AddRecipientIdToChatMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_messages, :recipient_id, :integer
  end
end
