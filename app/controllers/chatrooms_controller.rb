class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @users = User.all_parents
    # @message = Message.new
  end

  def show
    @single_chatroom = Chatroom.find(params[:id])
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @message = Message.new
    @users = User.all_parents
    # @messages = @single_chatroom.messages.order(created_at: :asc)
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
