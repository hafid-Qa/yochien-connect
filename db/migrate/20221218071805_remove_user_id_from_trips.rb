class RemoveUserIdFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :user_id
  end
end
