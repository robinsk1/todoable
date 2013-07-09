class AddColsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :country, :string
    add_column :locations, :user_input, :string
  end
end
