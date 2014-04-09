require 'spec_helper'

describe ToursController do


  before do
    @user = create :user
    controller.stubs(:current_user).returns @user

    #@ability = Object.new.extend(CanCan::Ability)
    #controller.stubs current_ability: @ability
  end

  let(:tour) { create :tour, user: @user }

  context 'authorizes resource' do

    context '#index' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:index, Tour).returns true
        get :index
      end
    end

    context '#create' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:create, instance_of(Tour)).returns true
        post :create, tour: attributes_for(:tour)
      end
    end

    context '#update' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:update, tour).returns true
        put :update, { id: tour.id, name: 'new_name' }
      end
    end

    context '#destroy' do
      it 'authorizes resource' do
        controller.expects(:authorize!).with(:destroy, tour).returns true
        delete :destroy, { id: tour.id }
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
