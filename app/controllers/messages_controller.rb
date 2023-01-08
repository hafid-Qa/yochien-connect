class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
   @chatrooms = policy_scope(Chatroom)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # send the newly created message to everyone who is listening
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/index", status: :unprocessable_entity
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
