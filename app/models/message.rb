class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true, allow_blank: false

  def from_same_user?(some_user)
    user == some_user
  end
end
