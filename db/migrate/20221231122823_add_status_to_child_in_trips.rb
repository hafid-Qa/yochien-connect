class AddStatusToChildInTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :child_in_trips, :status, :integer
  end
end
