class RenameStatusToComplete < ActiveRecord::Migration
  def up
    rename_table :statuses, :completes
  end

  def down
    rename_table :completes, :statuses
  end
end
