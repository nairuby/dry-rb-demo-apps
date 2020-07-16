# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: {
    message: 'already exists',
    case_sensitive: false
  }
  validates :name, length: { minimum: 3 }
  validates :age, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :email, presence: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'invalid format'
  }
  validates :email, uniqueness: {
    message: 'already exists',
    case_sensitive: false
  }
end
