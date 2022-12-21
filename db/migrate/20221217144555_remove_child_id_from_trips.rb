class RemoveChildIdFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :child_id
  end
end
