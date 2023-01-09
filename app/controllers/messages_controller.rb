class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatrooms, :set_messages, only: :create

  def create
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
  end

  private

  def set_chatrooms
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatrooms = policy_scope(Chatroom)
  end

  def set_messages
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
