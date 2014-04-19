require 'spec_helper'

describe Tour do

  context 'managing #active?' do

    context 'when user has two tours' do
      let(:user) { create :user }

      before do
        user.tours << [@first=build(:tour), @second=build(:tour)]
      end

      context 'when one is active' do
        before do
          @first.update_attributes! active: true
        end

        context 'when update active on the other' do
          before do
            @second.update_attributes! active: true
          end

          it 'deactivates the previously active tour' do
            @first.reload
            expect(@first.active).to be_false
          end

        end
      end

    end
  end
end
