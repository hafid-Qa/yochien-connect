class ChildrenController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @children = policy_scope(Child)
    @chatroom = Chatroom.first
  end
end
