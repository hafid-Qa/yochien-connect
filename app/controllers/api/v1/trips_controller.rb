class Api::V1::TripsController < ApplicationController
  def all
    children = Child.all
    render json: children
    authorize children
  end

  def update
    
  end

end
