require 'spec_helper'

describe SubscriptionsController do
  context "get /callback" do

    it "should extract challenge and echo response" do
      get :callback_confirm, "hub.challenge" => "randomString"
      response.body == "randomString"
    end

  end

  context "post /callback" do

  end

end
