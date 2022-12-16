class AddDateOfBirthToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :date_of_birth, :date
  end
end
