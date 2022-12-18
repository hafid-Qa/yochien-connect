class AddTripNoToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :trip_no, :integer
  end
end
