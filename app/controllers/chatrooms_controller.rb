class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    # this empty message is here so that
    # simple form can create the form
    @message = Message.new
  end
end
