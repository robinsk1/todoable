class AddAuthorIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :author_id, :integer
  end
end
