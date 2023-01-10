class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatrooms_and_users, only: %i[index show]

  def index
    @admins = User.all_admins
  end

  def show
    @single_chatroom = Chatroom.find(params[:id])
    @message = Message.new
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

  def set_chatrooms_and_users
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @users = User.all_parents
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
