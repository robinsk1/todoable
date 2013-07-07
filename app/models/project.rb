class Project < ActiveRecord::Base
  attr_accessible :description, :name, :tag_list, :pictures_attributes, :location_attributes
  has_many :todos, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :pictures, :as => :imageable, :dependent => :destroy
  has_one :location, :as => :locationable
  belongs_to :user

  accepts_nested_attributes_for :pictures, :location

  validates_presence_of :description, :name, :tag_list, :location

  resourcify
  acts_as_taggable

  rails_admin do
  #   # Found associations:

         configure :location, :has_one_association
         configure :user, :belongs_to_association
         configure :todos, :has_many_association
         configure :participations, :has_many_association
         configure :roles, :has_many_association
         #configure :taggings, :has_many_association         # Hidden
         #configure :base_tags, :has_many_association         # Hidden
         #configure :tag_taggings, :has_many_association         # Hidden
         configure :tags, :has_many_association         # Hidden

    #   # Found columns:

         configure :id, :integer
         configure :name, :string
         configure :description, :text
         configure :created_at, :datetime
         configure :updated_at, :datetime
         configure :user_id, :integer         # Hidden

  end

  #items => all items of the project
  def items
    self.todos
  end

  #done? => true if all its items are 'closed'
  def done?
    items.collect{|a|a.status}.include?(false) ? false : true
  end

  #items_by_days => hash of items grouped by day
  def items_by_days
    items.group_by{|v|v[:created_at].to_date}
  end

  #recent_items => items that were created today
  def recent_items
    items.where(["DATE(created_at) = DATE(?)", Time.now]).all
  end


end
