desc "Call latitude endpoint to check for updated location"
task :fetch_location => :environment do
  puts "feching location..."
  Location.fetch
  puts "done."
end

desc "call askgeo service to check for UTC offset"
task :update_timezone_offset => :environment do
  puts "updating offset..."
  CurrentOffset.update_offset
  puts "done."
end

desc "Call Instagram to check for new heymarseiles photos"
task :fetch_photos => :environment do
  puts "feching photos..."
  Instagram::Downloader.update_media_for_user
  puts "done."
end
