class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    current_user.is_online
    # ActionCable.server.broadcast("appearance_channel", {
    #   appearance_partial: ApplicationController.renderer.render(partial: "chat_rooms/appearance", locals: { user: current_user }),
    #   user_id: current_user.id
    # })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.is_offline
  end
end
