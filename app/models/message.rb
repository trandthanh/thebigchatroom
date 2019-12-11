class Message < ApplicationRecord
  after_create :broadcast_message

  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true, allow_blank: false

  def from_same_user?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.chat_room.id}_channel", {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
      # message: @message.to_json
    })
  end
end
