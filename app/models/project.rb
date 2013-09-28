class Project < ActiveRecord::Base
  attr_accessible :description, :name, :tag_list, :picture_attributes, :location_attributes, :as =>[:default, :admin]
  attr_accessible :user_id, as: :admin
  has_many :todos, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_one :picture, :as => :imageable, :dependent => :destroy
  has_one :location, :as => :locationable, :dependent => :destroy
  belongs_to :user
  has_many :likes, :as => :likeable, :dependent => :destroy
  has_many :users, :through => :participations

  accepts_nested_attributes_for :picture, :location

  validates_presence_of :description, :name, :tag_list, :location

  resourcify
  acts_as_taggable

  #items => all items of the project

  state_machine :initial => :draft do

    event :publish do
      transition :draft => :published
    end

    event :reject do
      transition :draft => :rejected
    end


    event :edit do
      transition :published => :draft
    end

  end
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

  def self.search(q)
    Project.joins(:location).where(['locations.city ILIKE ? OR projects.name ILIKE ?', "%#{q}%", "%#{q}%"])
  end

  rails_admin do
      list do
        field :description
        field :name
        field :state, :state
      end

      edit do
        field :description
        field :name
        field :state, :state
      end
      state({
          events: {reject: 'btn-warning', edit: 'btn-warning', publish: 'btn-warning'},
          states: {draft: 'btn-warning', published: 'btn-warning', rejected: 'btn-warning'}
        })
  end


end
