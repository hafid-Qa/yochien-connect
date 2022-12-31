class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def create
  end

  def index
    query_trip = if Time.new.localtime.hour >= 14
                   ChildInTrip.where(trip_date: DateTime.current.to_date, trip_id: Trip.first.id)
                 else
                   ChildInTrip.where(trip_date: DateTime.current.to_date, trip_id: Trip.second.id)
                 end
    @children = query_trip.map { |trip| policy_scope(Child.find(trip.child_id)) }
  end

  def update
  end

  def cancel_transport
  end
end
