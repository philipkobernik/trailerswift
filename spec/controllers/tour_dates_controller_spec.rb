require 'spec_helper'

describe TourDatesController do


  before do
    @user = create :user
    controller.stubs(:current_user).returns @user

    #@ability = Object.new.extend(CanCan::Ability)
    #controller.stubs current_ability: @ability
  end

  let(:tour) { create :tour, user: @user }
  let(:tour_date) { create :tour_date, tour: tour }

  context 'authorizes tour_date' do

    context '#index' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:index, {tour => TourDate}).returns true
        get :index, tour_id: tour.id
      end
    end

    context '#create' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:create, instance_of(TourDate)).returns true
        post :create, { tour_id: tour.id}.merge!(attributes_for(:tour_date))
      end
    end

    context '#update' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:update, tour_date).returns true
        put :update, { tour_id: tour.id, id: tour_date.id, venue: 'new venue' }
      end
    end

    context '#destroy' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:destroy, tour_date).returns true
        delete :destroy, { tour_id: tour.id, id: tour_date.id }
      end
    end
  end

  #context 'when authorized' do
    #before do
      #@ability.can :manage, :all
    #end
  #end

  #context 'when NOT authorized' do

  #end

end


