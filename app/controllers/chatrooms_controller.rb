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

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :index, status: :unprocessable_entity
    end
    authorize @chatroom
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
