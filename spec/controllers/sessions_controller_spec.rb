require 'spec_helper'

describe SessionsController do
  render_views

  let(:user) { create :user }
  let(:user_with_active_tour) { create :user, tours: [active_tour] }
  let(:active_tour) { build :tour, active: true }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  context "#create" do

    context "JSON request" do

      let(:do_request) { get :create, create_params.merge!(format: :json) }
      subject { response }

      before do
        do_request
      end

      context "When correct credentials" do
        let(:create_params) { {user: {email: user.email, password: 'password'} } }

        it { should be_success }

        it "should include auth_token " do
          JSON.parse(response.body)['auth_token'].should eq(user.auth_token)
        end

        it "should include auth_token " do
          JSON.parse(response.body)['email'].should eq(user.email)
        end

        it "should include band_name " do
          JSON.parse(response.body)['band_name'].should eq(user.band_name)
        end

        context 'when user has active_tour' do
          let(:create_params) { {user: {email: user_with_active_tour.email, password: 'password'} } }

          it "includes active tour name" do
            JSON.parse(response.body)['active_tour']['name'].should eq(active_tour.name)
          end

          it "includes active tour id" do
            JSON.parse(response.body)['active_tour']['id'].should eq(active_tour.id)
          end
        end

        context 'when user doesn NOT have active tour' do
          it "does not include 'active_tour' attributes" do
            JSON.parse(response.body)['active_tour'].should be_nil
          end
        end
      end

      context "When incorrect credentials" do
        let(:create_params) { {user: {email: user.email, password: 'wrong'} } }

        its(:status) { should eq(401) }

        it 'should have error message' do
          JSON.parse(response.body)['errors'].should eq(['Login failed.'])
        end
      end
    end
  end
end
