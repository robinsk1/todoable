class Complete < ActiveRecord::Base
  attr_accessible :todo_id
  belongs_to :todo
  belongs_to :user
end
