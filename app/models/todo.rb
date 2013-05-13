class Todo < ActiveRecord::Base
  attr_accessible :description, :status
end
