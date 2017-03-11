class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    end
    if user.role == "editor"
      can :access, :rails_admin
      can :dashboard
      can [ :read, :create, :update ],
       [ Talent, GalleryPicture ]
      can :read, [ User ]
    end
    if user.role == "pr"
      can :access, :rails_admin
      can :dashboard
      can :read, [ User, Talent, GalleryPicture ]
    end
  end
end
