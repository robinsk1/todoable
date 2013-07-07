class RemoveColsFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :name
    remove_column :pictures, :cover_image_url
    remove_column :pictures, :cover_image
  end

  def down
    add_column :pictures, :cover_image, :string
    add_column :pictures, :cover_image_url, :string
    add_column :pictures, :name, :string
  end
end
