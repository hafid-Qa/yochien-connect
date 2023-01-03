class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @children = policy_scope(Child)
  end
end
