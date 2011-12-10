class CreateLynks < ActiveRecord::Migration
  def change
    create_table :lynks do |t|
      t.references :user
      t.references :deal

      t.timestamps
    end
    add_index :lynks, :user_id
    add_index :lynks, :deal_id
  end
end
