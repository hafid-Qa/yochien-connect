class CreateChildInTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :child_in_trips do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :child, null: true, foreign_key: true
      t.date :trip_date

      t.timestamps
    end
  end
end
