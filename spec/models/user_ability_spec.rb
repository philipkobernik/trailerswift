require 'spec_helper'

describe 'User Abilities' do

  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }

  # admin has all abilities
  context "admin" do

    before do
      user.stubs(:admin?).returns true
      @object = user
    end

    include_examples 'has restful abilities', RESTFUL_ACTIONS

  end

  # non-admins can show, edit, update themselves
  context "non admin" do

    before do
      user.stubs(:admin?).returns false
      @object = user
    end

    include_examples 'has restful abilities', [:show, :edit, :update]
  end
end

