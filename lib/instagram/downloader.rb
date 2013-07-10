module Instagram
  class Downloader
    class << self

      def instagram_client
        Instagram.client access_token: ENV['instagram_access_token']
      end

      def update_media_for_user user_id=19007880, options={}
        images = instagram_client.user_recent_media(user_id, options.merge(count: 3))
        create_images_from images

      end

      def update_media_for_tag tag="heymarseilles"
        images = instagram_client.tag_recent_media tag
        create_images_from images
      end

      def create_images_from images
        images.reverse.each do |image|
          if image.location?
            i = InstagramPhoto.new
            i.lat = image.location.latitude
            i.lng = image.location.longitude
          else
            next
          end

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
          i.tour = Tour.find_or_create_by name: Settings.current_tour

          begin
            i.save!
            puts "saved photo from #{i.instagram_user} with caption: #{i.caption}"
          rescue ActiveRecord::RecordNotUnique
            puts "not unique, skipping: #{i.caption}"
          end

        end
      end
    end

  end
end
