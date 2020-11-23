# 1. Create the Channel CORRECTLY unlike ANDRE LIVE FOR WORLD
class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_from chatroom
  end
end
