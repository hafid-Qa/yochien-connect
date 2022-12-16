class AddteacherToChildren < ActiveRecord::Migration[7.0]
  def change
    add_reference :children, :teacher, foreign_key: { to_table: 'users' }
  end
end
