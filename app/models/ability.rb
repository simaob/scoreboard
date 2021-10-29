# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:edit, :update], User do |usr|
        usr.id == user.id
      end
    end
  end
end
