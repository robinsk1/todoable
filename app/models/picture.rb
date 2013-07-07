class Picture < ActiveRecord::Base
  attr_accessible :remove_cover_image, :retained_cover_image, :cover_image
  belongs_to :imageable, :polymorphic => true
  image_accessor :cover_image
  resourcify
end
