class CreateTableTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :child, null: true, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.date :trip_date
      t.integer :status

      t.timestamps
    end
  end
end
