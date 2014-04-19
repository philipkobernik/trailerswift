require 'spec_helper'

describe SessionsController do
  render_views

  let(:user) { create :user }

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
          JSON.parse(response.body)['auth_token'].should_not be_blank
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
