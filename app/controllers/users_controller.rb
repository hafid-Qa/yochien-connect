class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatrooms_and_users, :set_single_chatroom, only: :show

  def show
    @message = Message.new
    @messages = @single_chatroom.messages.order(created_at: :asc)

    render "chatrooms/index"
  end

  private

  def set_chatrooms_and_users
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @user = User.find(params[:id])
    @users = User.all_parents
    @admins = User.all_admins
    authorize @user
  end

  def set_single_chatroom
    @chatroom_name = "private_#{@user.id}"
    set_chatroom = Chatroom.where(name: @chatroom_name).first
    create_private_chatroom = Chatroom.create_private_chatroom([@user, current_user, @admins].flatten,
                                                               @chatroom_name)
    @single_chatroom = set_chatroom || create_private_chatroom
  end
end
