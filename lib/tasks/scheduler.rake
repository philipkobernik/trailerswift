desc "Call latitude endpoint to check for updated location"
task :fetch_location => :environment do
  puts "feching location..."
  Location.fetch
  puts "done."
end
