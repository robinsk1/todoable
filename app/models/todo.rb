class Todo < ActiveRecord::Base
  attr_accessible :description, :status, :project_id
  belongs_to :project

  resourcify

  scope :closed, :conditions => ["status = ?", true]
  scope :open, :conditions => ["status = ?", false]
end
