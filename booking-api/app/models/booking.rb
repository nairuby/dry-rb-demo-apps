# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :validate_end_date, on: :create

  private

  def validate_end_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'cannot be before the start date') if end_date < start_date
  end
end
