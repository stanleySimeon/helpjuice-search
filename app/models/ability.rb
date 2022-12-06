class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article
    can :create, Article

    return unless user.present?

    can :manage, Article, user_id: user.id
  end
end
