require 'spec_helper'

describe 'Location Abilities' do

  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }
  let(:tour) { create(:tour, user: user) }
  let(:location) { create(:location) }

  # admin has all abilities
  context "admin" do

    before do
      user.stubs(:admin?).returns true
      @object = location
    end

    include_examples 'has restful abilities', RESTFUL_ACTIONS

  end

  context "non admin" do
    before do
      user.stubs(:admin?).returns false
      @object = location
    end

    context "when location is part of user's tour" do
      before do
        tour.locations << location
      end

      include_examples 'has restful abilities', RESTFUL_ACTIONS
    end

    context "when location is not part of user's tours" do
      include_examples 'has no abilities'
    end
  end
end

