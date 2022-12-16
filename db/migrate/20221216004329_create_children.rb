class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.references :parent, foreign_key: { to_table: 'users' }
      t.integer :status
      t.string :full_address
      t.string :full_name

      t.timestamps
    end
  end
end
