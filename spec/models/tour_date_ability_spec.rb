require 'spec_helper'

describe 'Tour Date Abilities' do

  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }
  let(:tour) { create(:tour, user: user) }
  let(:tour_date) { create(:tour_date) }

  # admin has all abilities
  context "admin" do

    before do
      user.stubs(:admin?).returns true
      @object = tour_date
    end

    include_examples 'has restful abilities', RESTFUL_ACTIONS

  end

  context "non admin" do
    before do
      user.stubs(:admin?).returns false
      @object = tour_date
    end

    context "when tour_date is part of user's tour" do
      before do
        tour.tour_dates << tour_date
      end

      include_examples 'has restful abilities', RESTFUL_ACTIONS
    end

    context "when tour_date is not part of user's tours" do
      include_examples 'has no abilities'
    end
  end
end


