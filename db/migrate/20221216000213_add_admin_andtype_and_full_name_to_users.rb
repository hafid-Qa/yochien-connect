class AddAdminAndtypeAndFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean ,default: false
    #Ex:- :default =>''
    add_column :users, :type, :string
    add_column :users, :full_name, :string
  end
end
