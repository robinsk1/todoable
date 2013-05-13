class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :todos, :dependent => :destroy


  #items => all items of the project

  def items
    self.todos
  end

  #done? => true if all its items are 'closed'

  def done?

    items.map {|a|a.closed} ? true : false

  end

  #items_by_days => hash of items grouped by day

  def items_by_days

  end

  #recent_items => items that were created today

  def recent_items

  end





end
