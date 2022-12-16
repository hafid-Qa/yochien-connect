class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def create
  end

  def index
    @children = policy_scope(Child)
  end

  def update
  end

  def cancel_transport
  end
end
