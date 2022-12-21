class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def create
  end

  def index
    going_to_school = Trip.first.id
    going_to_home = Trip.second.id
    today_trip = ChildInTrip.where(trip_date: DateTime.current.to_date, trip_id: going_to_school)
    @children = today_trip.map { |trip| policy_scope(Child.find(trip.child_id)) }
    
  end

  def update
  end

  def cancel_transport
  end
end
