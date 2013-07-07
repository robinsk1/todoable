class Participation < ActiveRecord::Base
  attr_accessible :user_id, :project_id
  belongs_to :project
  belongs_to :user
   resourcify
end
