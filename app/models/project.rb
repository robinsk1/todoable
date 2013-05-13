class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :todos, :dependent => :destroy


  #items => all items of the project
  def items
    self.todos
  end

  #done? => true if all its items are 'closed'
  def done?
    items.collect {|a|a.status}.include?(false) ? false : true
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
