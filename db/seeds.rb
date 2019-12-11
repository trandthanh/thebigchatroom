# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Notification.destroy_all
ChatRoom.destroy_all
User.destroy_all

puts "seeding..."
general_chat = ChatRoom.create(name: "general")
help_chat = ChatRoom.create(name: "help")

anakin = User.create(username: "Anakin Skywalker", email: "anakin@skywalker.com", password: "123456")
padme = User.create(username: "Padme Amidala", email: "padme@amidala.com", password: "123456")
obiwan = User.create(username: "Obiwan Kenobi", email: "obiwan@kenobi.com", password: "123456")

message_1 = Message.create(user: anakin, chat_room: general_chat, content: "hi people!")
message_2 = Message.create(user: anakin, chat_room: help_chat, content: "hi!")
message_3 = Message.create(user: padme, chat_room: help_chat, content: "hi there!")
message_4 = Message.create(user: obiwan, chat_room: general_chat, content: "hiyz!")
puts "done seeding..."
