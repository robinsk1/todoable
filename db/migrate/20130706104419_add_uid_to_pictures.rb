class AddUidToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :cover_image_uid, :string
  end
end
