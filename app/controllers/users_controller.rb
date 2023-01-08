class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @users = User.all_parents
    @admins = User.all_admins
    authorize @user

    @chatrooms = Chatroom.public_chatrooms
    @chatroom = Chatroom.new
    @chatroom_name = "private_#{@user.id}"
    @single_chatroom = set_single_chatroom

    @message = Message.new
    @messages = @single_chatroom.messages.order(created_at: :asc)

    render "chatrooms/index"
  end

  private

  def set_single_chatroom
    Chatroom.where(name: @chatroom_name).first || Chatroom.create_private_chatroom([@user, current_user, @admins].flatten,
                                                                                   @chatroom_name)
  end
end
