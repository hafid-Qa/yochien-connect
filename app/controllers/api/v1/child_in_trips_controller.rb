class Api::V1::ChildInTripsController < ApplicationController
  def update
    trip = ChildInTrip.find(params[:id].to_i)
    trip.update(child_in_trips_params)
    children = Child.all
    render json: children
    authorize [:api, :v1, trip]
  end

  private

  def child_in_trips_params
    params.require(:child_in_trip).permit(:status)
  end
end
