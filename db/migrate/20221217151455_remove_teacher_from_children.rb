class RemoveTeacherFromChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :teacher_id
  end
end
