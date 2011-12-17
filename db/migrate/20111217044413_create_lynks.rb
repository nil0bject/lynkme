class CreateLynks < ActiveRecord::Migration
  def change
    create_table :lynks do |t|
      t.references :deal
      t.references :user

      t.timestamps
    end
    add_index :lynks, :deal_id
    add_index :lynks, :user_id
  end
end
