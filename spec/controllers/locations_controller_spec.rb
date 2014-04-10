require 'spec_helper'

describe LocationsController do


  before do
    @user = create :user
    controller.stubs(:current_user).returns @user

    #@ability = Object.new.extend(CanCan::Ability)
    #controller.stubs current_ability: @ability
  end

  let(:tour) { create :tour, user: @user }
  let(:location) { create :location, tour: tour }

  context 'authorizes location' do

    context '#index' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:index, {tour => Location}).returns true
        get :index, tour_id: tour.id
      end
    end

    context '#create' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:create, instance_of(Location)).returns true
        post :create, { tour_id: tour.id}.merge!(attributes_for(:location))
      end
    end

    context '#update' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:update, location).returns true
        put :update, { tour_id: tour.id, id: location.id, name: 'new_name' }
      end
    end

    context '#destroy' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:destroy, location).returns true
        delete :destroy, { tour_id: tour.id, id: location.id }
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

