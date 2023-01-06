class ChatroomsController < ApplicationController
  def index
    @message = Message.new
    @chatrooms = policy_scope(Chatroom)
  end

  def show
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    render "index"
  end
end
