class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :item
      t.references :user
      t.decimal :price
      t.integer :quota
      t.datetime :expiry_date

      t.timestamps
    end
    add_index :deals, :item_id
    add_index :deals, :user_id
  end
end
