# frozen_string_literal: true

class BookingSerializer < BaseSerializer
  attribute :id
  attribute :start_date
  attribute :end_date
  attribute :user_id
end