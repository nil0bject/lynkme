class RenameTypeToSupplier < ActiveRecord::Migration
  def up
    rename_column(:users, :type, :supplier)
    change_column(:users, :supplier, :boolean)
  end

  def down
  end
end
