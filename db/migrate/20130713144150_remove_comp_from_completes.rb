class RemoveCompFromCompletes < ActiveRecord::Migration
  def up
    remove_column :completes, :complete
  end

  def down
    add_column :completes, :complete, :boolean
  end
end
