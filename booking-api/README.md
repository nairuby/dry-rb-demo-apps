# Booking API
This is a collection of Booking API endpoints and Rails Admin dashboard.

## Prerequisites
Ensure you have the following tools set in place
* RVM - follow these instructions [here](https://rvm.io/rvm/install)
* NVM - Install it by following these [instructions](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
* Rails `-v 5.2.4` - if not install it with: `gem install rails -v 5.2.4`
* Ruby `-v 2.6.0` - if not `rvm install "2.6.0"` then make it default with: `rvm use 2.6.0`
* Node.js -v `10.13.x` - if not `nvm install "10.13.0"` then make it default with: `nvm use 10.13.0`
* Postgres app - installation instructions for Mac - [link](https://postgresapp.com/).
For linux, follow [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04) to setup postgres locally

## Install app dependencies
Run these commands in the order that they appear:
```sh
# Install Rails gems
bundle install

# Setup DB - ENSURE Postgres engine is installed & ready to receive connections
rails db:setup

# Create DB tables
rails db:migrate
```

## Running dev server
After the above commands have completed, then you're ready to start the dev server:
 `bin/rails server`.

Navigate to `localhost:3000/heartbeat`, you should see this on your browser:
```json
{
  "status": "ok"
}
```

## Dummy data
To create dummy bookings data, open your terminal and run:
```sh
# create users first
rake user:create

# then create bookings
rake user:bookings:create
```

Then open `localhost:3000/api/v1/bookings` to view them.

**Admin dashboard**

Navigate to `http://localhost:3000/admin/` on your favourite browser to view the `bookings` and `users`  you've just created :)


## Running tests
To run tests in real-time, use `Guard`. The command is: `bundle exec guard`. This runs tests as files change.

But if you prefer to run the tests once, use this command: `bundle exec rspec spec`.

## Routing

To see all the routes open your browser and navigate to: `localhost:3000/rails/info/routes`
