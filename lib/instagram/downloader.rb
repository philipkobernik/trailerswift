module Instagram
  class Downloader
    class << self

      def update_media_for_user user_id, options={}
        instagram_client = Instagram.client access_token: Settings.instagram.access_token
        images = instagram_client.user_recent_media(user_id, options)

        images.reverse.each do |image|
          i = InstagramPhoto.new
          i.tags = image.tags
          i.created_time = image.created_time
          i.link = image.link
          i.img_url_thumb = image.images.thumbnail.url
          i.img_url_low = image.images.low_resolution.url
          i.img_url_standard = image.images.standard_resolution.url
          i.caption = image.caption.text
          i.users_in_photo = image.users_in_photo.map { |tagged| [tagged.user.username, tagged.user.profile_picture] }
          i.instagram_user = image.user.username
          i.instagram_user_id = image.user.id
          i.instagram_id = image.id

          if image.location?
            i.lat = image.location.latitude
            i.lng = image.location.longitude
          end


          begin
            i.save!
          rescue ActiveRecord::RecordNotUnique
            puts "not unique, skipping: #{i.caption}"
          end

          puts "saved photo with caption: #{i.caption}"
        end
      end

      def update_media_for_tag tag

      end
    end

  end
end
