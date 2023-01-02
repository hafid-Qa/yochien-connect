class Api::V1::TripsController < ApplicationController
  def all
    children = Child.all
    render json: children
    authorize children
  end

  # respond_to do |format|
  #   format.json { children }
  # end
end
