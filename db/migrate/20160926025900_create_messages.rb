class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id, comment: "chat id"
      t.integer :user_id, comment: "user id"
      t.text :content, comment: "message content"

      t.timestamps
    end
  end
end
