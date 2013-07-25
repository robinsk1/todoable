class Todo < ActiveRecord::Base
  attr_accessible :description, :project_id, :author_id
  belongs_to :project
  has_many :completes, :dependent => :destroy
  has_many :likes, :as => :likeable, :dependent => :destroy
  validates_presence_of :description

  acts_as_voteable

  resourcify


  def author
    if !author_id.nil? && (author_id != project.user.id)
      User.find(author_id)
    else
      project.user
    end
  end

  def open?(user)
    if (completes.empty?) || (completes.where(["completes.user_id != ?", user.id]))
      true
    else completes.where(["completes.user_id = ?", user.id])
      false
    end

  end


end
