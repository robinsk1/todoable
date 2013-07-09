class Location < ActiveRecord::Base
  attr_accessible :city, :as => [:default, :admin]
  belongs_to :locationable, :polymorphic => true
  validates :city, presence: { allow_blank: false, allow_nil: false }
  resourcify
end
