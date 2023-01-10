class Api::V1::TripsController < ApplicationController
  before_action :authenticate_user!

  def update
    trip = Trip.find(params[:id].to_i)
    trip.update(trips_params)
    children = policy_scope(Child)
    render json: children
    authorize [:api, :v1, trip]
  end

  private

  def trips_params
    params.require(:trip).permit(:status)
  end
end
