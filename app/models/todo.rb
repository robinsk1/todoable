class Todo < ActiveRecord::Base
  attr_accessible :description, :status
  belongs_to :project
end
