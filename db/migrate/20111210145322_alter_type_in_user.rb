class AlterTypeInUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :type, :string
    end
  end

  def down
  end
end
