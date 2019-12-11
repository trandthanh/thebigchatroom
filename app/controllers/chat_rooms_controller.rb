class ChatRoomsController < ApplicationController
  # before_action :appearance_broadcast, only: [:show]

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])

    @message = Message.new

    # @users = User.where.not(id: current_user.id).joins(:messages).where(messages: { chat_room: @chat_room }).uniq
    @users = User.joins(:messages).where(messages: { chat_room: @chat_room }).uniq


    current_user_chat_notification = Notification.find_by(user: current_user, chat_room: @chat_room)
    if (current_user_chat_notification && current_user_chat_notification.unseen > 0)
      current_user_chat_notification.unseen = 0
      current_user_chat_notification.save
    end

  end



end
