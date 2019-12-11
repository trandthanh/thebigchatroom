class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "notification_user#{params[:user_id]}_chatroom#{params[:chat_room_id]}_channel"
    stream_from "notifications_user#{params[:user_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
