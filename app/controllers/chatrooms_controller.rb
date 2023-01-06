class ChatroomsController < ApplicationController
  def index
    @message = Message.new
    @chatrooms = policy_scope(Chatroom)
    @users = User.all_except(current_user)
    @chatroom = Chatroom.new
  end

  def show
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    @users = User.all_except(current_user)
    authorize @chatroom
    render "index"
  end
end
