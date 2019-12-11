class Message < ApplicationRecord
  after_create :broadcast_message, :create_notification

  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true, allow_blank: false

  def from_same_user?(some_user)
    user == some_user
  end

  def create_notification
    if Notification.find_by(user: self.user, chat_room: self.chat_room).nil?
      Notification.create(user: self.user, chat_room: self.chat_room, unseen: 0)
    else
      notifications = Notification.where.not(user: self.user).where(chat_room: self.chat_room)
      notifications.each do |notification|
        notification.unseen += 1
        notification.save
      end
      # notifications.first.unseen += 1
      # notifications.save
    end
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.chat_room.id}_channel", {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
      # message: @message.to_json
    })
  end
end
