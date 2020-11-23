require_relative "mario"

# puts "Clean the DB"
# Chatroom.destroy_all
# User.destroy_all
# Message.destroy_all

puts 'Create a Chatroom'
Chatroom.create(name: "general")

puts "Create Users"
users_data = [
  {email: "player@one.com", nickname: "Mario", password: "123456", photo_url: 'https://dbdzm869oupei.cloudfront.net/img/t-shirts/preview/21176.png'},
  {email: "player@two.com", nickname: "Luigi", password: "123456", photo_url: 'https://dbdzm869oupei.cloudfront.net/img/t-shirts/preview/5e955184d9d0b.png'}
]

users_data.each { |user_datum| User.create(user_datum) }

puts "Create messages"
Message.create! content: "Yahoo", user: User.first, chatroom: Chatroom.first

puts "Done! Enjoy Yahoo!!!"

puts Mario