class AddPloyTypesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :locationable_type, :string
    add_column :locations, :locationable_id, :integer
  end
end
