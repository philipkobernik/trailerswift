class Ability
  include CanCan::Ability

  def initialize user
    @user = user
    return unless @user

    if @user.admin?
      can :manage, :all
      return
    end

    user_abilities
    tour_abilities
    location_abilities
    tour_date_abilities
  end

  def user_abilities
    can [:show, :edit, :update], User, :id => @user.id
  end

  def tour_abilities
    can :manage, Tour, :user_id => @user.id
    can [:show, :index], Tour
  end

  def location_abilities
    can :manage, Location, tour: { :user_id => @user.id }
  end

  def tour_date_abilities
    can :manage, TourDate, tour: { :user_id => @user.id }
  end
end

