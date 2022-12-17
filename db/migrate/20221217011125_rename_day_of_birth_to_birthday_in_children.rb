class RenameDayOfBirthToBirthdayInChildren < ActiveRecord::Migration[7.0]
  def change
    rename_column :children, :date_of_birth, :birthday
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
