class RenameTypeToSupplier < ActiveRecord::Migration
  def up
    remove_column(:users, :type)
    add_column(:users, :supplier, :boolean)
  end

  def down
  end
end
