require 'spec_helper'

describe User do
  let(:active_tour) { create :tour, active: true }
  let(:inactive_tour) { create :tour, active: false }
  let(:user_with_active_tour) { create :user, tours: [active_tour, inactive_tour] }

  let(:user_with_no_tours) { create :user }

  context 'instance methods' do

    context '#active_tour' do
      context 'when user has active tour' do
        subject { user_with_active_tour.active_tour }
        it { should eq active_tour }

      end

      context 'when user has NO tours' do
        subject { user_with_no_tours.active_tour }
        it { should be_nil }

      end
    end
  end
end
