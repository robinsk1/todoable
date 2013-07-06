class Picture < ActiveRecord::Base
  attr_accessible :name, :cover_image_name, :cover_image_url, :cover_image, :remove_cover_image, :retained_cover_image
  belongs_to :imageable, :polymorphic => true
  image_accessor :cover_image

end
