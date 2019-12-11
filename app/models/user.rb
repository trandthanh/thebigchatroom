class User < ApplicationRecord
  after_update :broadcast_appearance

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  def is_online
    self.update_attributes(online: true)
  end

  def is_offline
    self.update_attributes(online: false)
  end

  def broadcast_appearance
    ActionCable.server.broadcast("appearance_channel", {
      appearance_partial: ApplicationController.renderer.render(partial: "chat_rooms/appearance", locals: { user: self }),
      user_id: self.id
    })
  end
end
