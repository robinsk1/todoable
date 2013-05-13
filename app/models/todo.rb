class Todo < ActiveRecord::Base
  attr_accessible :description, :status
  belongs_to :project

  scope :closed, :conditions => ["status = ?", true]
  scope :open, :conditions => ["status = ?", false]


end
