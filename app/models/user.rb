class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :todos, :through => :projects
  has_many :participations
  has_many :completes
  has_many :likes

  has_many :joinups, :class_name => "Participation", :foreign_key => :user_id, :include => :project
  #has_many :members, :through => :follows, :foreign_key => :project_id, :source => :user
  has_many :projects, :dependent => :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :role_ids, :as => :admin
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


end
