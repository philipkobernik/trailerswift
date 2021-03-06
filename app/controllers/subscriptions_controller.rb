class SubscriptionsController < ApplicationController
  respond_to :json

  def callback_confirm

    respond_to do |format|
      format.any { render :text => params['hub.challenge'] }
    end

  end

  def callback_new_media
    puts params
    puts request.headers
    puts request.body

    string = request.body.read()
    puts ""
    puts " *********** STRING *********** "
    puts ""
    puts string

    puts ""
    puts " *********** BODY *********** "
    puts ""
    body = JSON.parse(string)
    puts body

    body.each do |attrs|
      puts "update attrs from instagram:"
      puts attrs
      InstagramPhoto.from_payload! attrs
    end

    respond_to do |format|
      format.json { render :text => "", status: 200 }
      format.any { render :text => "only json, please", status: 400 }
    end

  end

end
