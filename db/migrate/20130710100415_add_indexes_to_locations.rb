class AddIndexesToLocations < ActiveRecord::Migration
  def change
    add_index :locations, :city
  end
end
