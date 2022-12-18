class AddTripDateToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :trip_date, :date
  end
end
