class Notification < ApplicationRecord
  after_update :broadcast_notification

  belongs_to :user
  belongs_to :chat_room

  validates_uniqueness_of :user_id, scope: :chat_room_id

  def broadcast_notification
    ActionCable.server.broadcast("notifications_user#{self.user.id}_channel", {
      notification_partial: ApplicationController.renderer.render(partial: "pages/notification", locals: { user: self.user, chat_room: self.chat_room }),
      chat_room_id: self.chat_room.id,
      user_message_id: Message.where(chat_room: self.chat_room).last.user.id
    })
  end
end
