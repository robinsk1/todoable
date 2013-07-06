class Project < ActiveRecord::Base
  attr_accessible :description, :name, :location, :tag_list, :pictures_attributes
  has_many :todos, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :pictures, :as => :imageable, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :pictures

  validates_presence_of :description, :name, :location, :tag_list

  resourcify
  acts_as_taggable

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
