class CreateChatMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_messages do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
