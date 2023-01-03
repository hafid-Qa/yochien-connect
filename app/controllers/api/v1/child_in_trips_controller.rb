class Api::V1::ChildInTripsController < ApplicationController
  def update
    return unless user_signed_in?

    trip = ChildInTrip.find(params[:id].to_i)
    trip.update(child_in_trips_params)
    if current_user.admin
      children = Child.all
    else
      children = Child.where(parent_id: current_user.id)
    end
    render json: children
    authorize [:api, :v1, trip]
  end

  private

  def child_in_trips_params
    params.require(:child_in_trip).permit(:status)
  end
end
