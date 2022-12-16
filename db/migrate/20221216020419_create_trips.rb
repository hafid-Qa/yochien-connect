class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :child, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :pick_up_time
      t.datetime :drop_off_time

      t.timestamps
    end
  end
end
