class Picture < ActiveRecord::Base
  attr_accessible :remove_cover_image, :retained_cover_image, :cover_image, :cover_image_url
  attr_accessible :cover_image, :retained_cover_image, :remove_cover_image, :as => :admin
  belongs_to :imageable, :polymorphic => true
  image_accessor :cover_image
  resourcify
end
