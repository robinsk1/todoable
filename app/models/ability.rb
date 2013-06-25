class   Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    unless user
      can :read, [Todo, Project]

      else
      # All registered users
      # Projects
      can :read, Project
      can :create, Project

      can :destroy, Project do |project|
        project.try(:user) == user
      end

      can :update, Project do |project|
        project.try(:user) == user
      end

      # Todos
      can :create, Todo
      can :read, Todo

      can :destroy, Todo do |todo|
         todo.try(:user) == user
      end

      can :toggle, Todo do |todo|
         todo.try(:user) == user
      end

      can :update, Todo do |todo|
         todo.try(:user) == user
      end



      # Admins
      if user.has_role?(:admin)
        can :manage, :all
      end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
