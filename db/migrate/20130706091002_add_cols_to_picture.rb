class AddColsToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
    add_column :pictures, :cover_image_name, :string
    add_column :pictures, :cover_image_url, :string
    add_column :pictures, :cover_image, :string
  end
end
