require 'spec_helper'

describe SubscriptionsController do
  context "get /callback" do

    it "should extract challenge and echo response" do
      pending
      get :callback_confirm, "hub.challenge" => "randomString"
      response.body == "randomString"
    end

  end

  context "post /callback" do
    let(:image_one) { stub }
    let(:image_two) { stub }
    let(:payload) do
      [
        {
          "subscription_id" => "1",
          "object" => "user",
          "object_id" => "1234",
          "changed_aspect" => "media",
          "time" => 1297286541
        },
        {
          "subscription_id" => "2",
          "object" => "tag",
          "object_id" => "nofilter",
          "changed_aspect" => "media",
          "time" => 1297286541
        }
      ]
    end

    let(:request) { post :callback_new_media, body: payload.to_json }

    before do
      InstagramPhoto.stubs(:create!).returns true
    end

    it "should create photo with each image_obj inside" do
      pending
      InstagramPhoto.expects(:from_payload!).twice
      request
    end

    it "should respond with 200 success" do
      pending
      request
      response.status.should == 200
    end

  end

end
