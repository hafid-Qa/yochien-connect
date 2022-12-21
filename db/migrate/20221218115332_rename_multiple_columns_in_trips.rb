class RenameMultipleColumnsInTrips < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :pick_up_time, :origin
    change_column :trips, :origin, :string
    rename_column :trips, :drop_off_time, :destination
    change_column :trips, :destination, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
