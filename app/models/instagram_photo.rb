class InstagramPhoto < ActiveRecord::Base

  class << self
    def from_payload! payload
      puts "*******====  payload is...  =====******"
      puts payload

      new = self.new
      new.tags = payload[:tags].to_s
      new.location = payload[:location].to_s
      new.created_time = payload[:created_time].to_s
      new.link = payload[:link].to_s
      new.images = payload[:images].to_s
      new.caption = payload[:caption].to_s
      new.user = payload[:user].to_s
      new.instagram_id = payload[:id]

      new.save!
    end
  end

end

