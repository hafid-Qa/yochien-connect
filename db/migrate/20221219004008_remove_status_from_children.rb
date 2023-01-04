class RemoveStatusFromChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :status
    
  end
end
