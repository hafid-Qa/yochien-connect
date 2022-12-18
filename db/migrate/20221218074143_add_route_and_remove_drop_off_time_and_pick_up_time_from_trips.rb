class AddRouteAndRemoveDropOffTimeAndPickUpTimeFromTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :route, null: true, foreign_key: true
    remove_column :trips, :pick_up_time
    remove_column :trips, :drop_off_time
  end
end
