class SubscriptionsController < ApplicationController

  def callback_confirm

    respond_to do |format|
      format.any { render :text => params['hub.challenge'] }
    end

  end

end
