class AddTripToChildren < ActiveRecord::Migration[7.0]
  def change
    add_reference :children, :trip, null: false, foreign_key: true
  end
end
