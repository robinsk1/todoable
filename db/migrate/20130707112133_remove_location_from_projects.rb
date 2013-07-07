class RemoveLocationFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :location
  end

  def down
    add_column :projects, :location, :string
  end
end
