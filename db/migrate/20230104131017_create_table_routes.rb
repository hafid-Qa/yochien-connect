class CreateTableRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.references :driver, null: true, foreign_key: { to_table: 'users' }
      t.integer :route_no

      t.timestamps
    end
  end
end
