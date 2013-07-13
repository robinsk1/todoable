class Complete < ActiveRecord::Base
  # attr_accessible :todo_id, :complete
  belongs_to :todo
  belongs_to :user

end
