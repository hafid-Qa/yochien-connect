class Api::V1::ChildrenController < ApplicationController
  def index
    children = policy_scope(Child)
    render json: children
    authorize [:api, :v1, children]
  end
end
