class ChatroomsController < ApplicationController
  def index
    @message = Message.new
    @chatrooms = policy_scope(Chatroom)
    @users = User.all_except(current_user)
    @chatroom = Chatroom.new
  end

  def show
    @single_chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.public_rooms
    @message = Message.new
    @chatroom = Chatroom.new
    @users = User.all_except(current_user)
    authorize @chatroom
    render "index"
  end
end
