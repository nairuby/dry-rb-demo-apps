# frozen_string_literal: true

namespace 'user' do
  desc 'Create users'
  task create: :environment do
    users.each {|u| User.create!(u) }
  end

  namespace 'bookings' do
    desc 'Create bookings for users'
    task create: :environment do
      bookings.each {|b|  Booking.create!(b) }
    end
  end
end

private

def users
  [
    {
      name: 'Jane Doe',
      email: 'janedoe@test.com',
      age: 23
    },
    {
      name: 'John Doe',
      email: 'johndoe@test.com',
      age: 20
    }
  ]
end

def bookings
  [
    {
      start_date: Time.zone.now,
      end_date: Time.zone.now + 1,
      user_id: User.first.id
    },
    {
      start_date: Time.zone.now,
      end_date: Time.zone.now + 1,
      user_id: User.first.id
    },
    {
      start_date: Time.zone.now,
      end_date: Time.zone.now + 1,
      user_id: User.last.id
    }
  ]
end
