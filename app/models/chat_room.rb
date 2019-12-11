class ChatRoom < ApplicationRecord
  has_many :messages
  has_many :chat_rooms
end
