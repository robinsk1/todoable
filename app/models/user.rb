class User < ActiveRecord::Base
  rolify

  has_many :todos, :through => :projects
  has_many :participations
  has_many :completes
  has_many :likes
  has_one :picture, :as => :imageable, :dependent => :destroy
  has_one :location, :as => :locationable, :dependent => :destroy

  has_many :joinups, :class_name => "Participation", :foreign_key => :user_id, :include => :project
  #has_many :members, :through => :follows, :foreign_key => :project_id, :source => :user
  has_many :projects, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  attr_accessible :role_ids, :as => :admin
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :picture_attributes, :location_attributes

  acts_as_voter

  include Authentication::ActiveRecordHelpers

  accepts_nested_attributes_for :picture, :location


  private

    def email_required?
      super && provider.blank?
    end

end
