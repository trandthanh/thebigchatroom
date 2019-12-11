class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  # before_action :appearance_broadcast

  def home
    @chat_rooms = ChatRoom.all
  end
end
