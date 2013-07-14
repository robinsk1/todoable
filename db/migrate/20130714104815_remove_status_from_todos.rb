class RemoveStatusFromTodos < ActiveRecord::Migration
  def up
    remove_column :todos, :status
  end

  def down
    add_column :todos, :status, :boolean
  end
end
