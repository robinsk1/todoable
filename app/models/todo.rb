class Todo < ActiveRecord::Base
  attr_accessible :description, :project_id, :author_id
  belongs_to :project
  has_many :completes, :dependent => :destroy
  validates_presence_of :description

  resourcify

  scope :closed, :conditions => ["status = ?", true]
  scope :open, :conditions => ["status = ?", false]

  def author
    if !author_id.nil? && (author_id != project.user.id)
      User.find(author_id)
    else
      project.user
    end
  end



end
