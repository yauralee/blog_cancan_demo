class Ability
  include CanCan::Ability

  def initialize(user)
    if user.category == 'admin'
      can :manage, :all
    elsif user.category == 'normal'
      can [:new, :create, :update, :destroy], Article, user_id: user.id
      can [:create, :update, :destroy], Comment
    elsif user.category == 'guest'
      can [:index, :show], Article, user_id: user.id
      can [:index, :show], Comment
    end
  end
end
