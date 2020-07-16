# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[5.2]
  def up
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :bookings
  end
end
