class SubscriptionsController < ApplicationController

  def callback_confirm

    respond_to do |format|
      format.any { render :text => params['hub.challenge'] }
    end

  end

  def callback_new_media
    puts request.inspect

    if params[:body].present?
      body = JSON.parse(params[:body])
      body.each do |attrs|
        puts "update attrs from instagram:"
        puts attrs
        InstagramPhoto.from_payload! attrs
      end
    end

    respond_to do |format|
      format.any { render :text => "", status: 200 }
    end

  end

end
