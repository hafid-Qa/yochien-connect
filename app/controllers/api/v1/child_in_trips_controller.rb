class Api::V1::ChildInTripsController < ApplicationController
  def update
    trip = ChildInTrip.find(params[:id].to_i)
    trip.update(child_in_trips_params)
    render json: trip
    authorize [:api, :v1, trip]
  end

  def all
    children = Child.all
    render json: children
    authorize children
  end

  private

  def child_in_trips_params
    params.require(:child_in_trip).permit(:status)
  end
end
