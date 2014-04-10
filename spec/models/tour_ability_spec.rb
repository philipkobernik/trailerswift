require 'spec_helper'

describe 'Tour Abilities' do

  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }
  let(:tour) { create(:tour) }

  # admin has all abilities
  context "admin" do

    before do
      user.stubs(:admin?).returns true
      @object = tour
    end

    include_examples 'has restful abilities', RESTFUL_ACTIONS

  end

  # non-admins can manage their
  context "non admin" do
    before do
      user.stubs(:admin?).returns false
      @object = tour
    end

    context "when user owns tour" do
      before do
        user.tours << tour
      end

      include_examples 'has restful abilities', RESTFUL_ACTIONS
    end

    context "when user does not own tour" do
      include_examples 'has restful abilities', [:index, :show]
    end
  end
end
