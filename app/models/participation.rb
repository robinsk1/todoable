class Participation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  has_many :todos, :through => :project

end
