class Status < ActiveRecord::Base
  # attr_accessible :todo_id, :complete
  attr_accessible :complete
  belongs_to :todo
  belongs_to :user

end
