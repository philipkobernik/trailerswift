# Trailer Swift
=============

Tour tracking


Developer Start-up
------------------
Notes for Mac OS X.

Make sure XCode is installed. You can get the installer from the App Store and then run that to do
the actual installation.

### Ruby and Rails

Install RVM, following [this guide](http://seanbehan.com/mac-os-x/installing-and-using-rvm-on-mac-os-x-creating-gemsets-and-reverting-to-original-environment/).

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

Place in ~/.bash_profile as the very last line

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

Start a new terminal window

    rvm install 2.0.0

This will install and compile Ruby. This may take a few minutes.


### Install postgres database

I haven't used it yet, but I hear the easiest way to run postgres on
your development machine is to use postgres.app from the folks at
heroku. It looks like it should work without needing any configuration.

[postgres.app](http://postgresapp.com/)

### Git the code

Clone the git repository

    git clone https://github.com/philipkobernik/trailerswift.git

    cd trailerswift
    (rvm will prompt you now, follow instructions to accept the .rvmrc file)

### Install gem dependencies

    bundle install

If you get an error about using the bundle command, you will need to go
install [rubygems](http://docs.rubygems.org/read/chapter/3)


### Create the database

    rake db:create

### Migrate the database

This task applies database migrations to your db to create tables

    rake db:migrate

### Start the application

Spin up the server and verify that the application works:

    rails server
    open http://localhost:3000

A browser window should open and display something

### Run the specs?
I don't remember if there are any specs yet.

    rake db:test:prepare
    rspec spec/

## Notes / thoughts

Current:
 * app loads location lat/lngs from db
 * assumes that most recent lat/lng is position of trailer
 * requires reload to see updates...

Imagined (real-time magic):
 * app bootstraps existing data points, existing photos
 * gets real-time updates on locations, animates van and draws line
 * gets real-time updates on photos tagged #TrailerSwift posts them at real location OR user's location
 * gets real-time updates on photos tagged #HeyMarseilles

App caches photos in DB by subscribing to the tags TrailerSwift and HeyMarseilles

App caches photos posted by HM instagram account... displays these more prominently

Pieces involved:

Realtime -- integrate with pubnub/pusher for push updates

Instagram --
InstagramClient that subscribes to 
 * hey marseilles user new photos
 * tag: TrailerSwift
 * tag: HeyMarseilles

Subscription flow needs:
 * endpoint for subscription callback http://instagram.com/developer/realtime/
 * respond to GET by echoing the challenge string
 * respond to POST request of new photos...

SUBSCRIPTION does not need access_token.
