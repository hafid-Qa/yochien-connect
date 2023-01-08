class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_parents

    @chatrooms = Chatroom.public_chatrooms
    @chatroom = Chatroom.new
    @chatroom_name = set_chatroom_name(@user, current_user)
    @single_chatroom = set_single_chatroom

    @message = Message.new
    @messages = @single_chatroom.messages.order(created_at: :asc)
    redirect_to chatrooms_path
  end

  private

  def set_chatroom_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end

  def set_single_chatroom
    Chatroom.where(name: @chatroom_name).first || Chatroom.create_private_chatroom([@users, @current_user].flatten,
                                                                                   @chatroom_name)
  end
end
