# Step 3. Broadcast the new message to the channel when the message is created

class MessagesController < ApplicationController
  # all of this here is on the 3rd lecture of Rails -> Adv Routing
  def create
    @message = Message.new(strong_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user
    # after saving
    if @message.save
      # broadcast the message to the channel
      ChatroomChannel.broadcast_to(
        @chatroom,
        # render_to_string is HTML.to_s
        render_to_string(partial: "message", locals: { message: @message })
      )

      redirect_to chatroom_path(@chatroom.id)
    else
      render 'chatrooms/show'
    end
  end

  private

  def strong_params
    # access the data inside the form
    # permit what we want to allow
    params.require(:message).permit(:content)
  end
end
