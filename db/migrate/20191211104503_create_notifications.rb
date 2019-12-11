class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :chat_room, foreign_key: true
      t.integer :unseen

      t.timestamps
    end
  end
end
