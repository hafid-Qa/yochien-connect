class Api::V1::ChildInTripsController < ApplicationController
  def update
    raise
  end

  def all
    children = Child.all
    render json: children
    authorize children
  end
end
