class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :supplier
      t.string :session_id

      t.timestamps
    end
  end
end
