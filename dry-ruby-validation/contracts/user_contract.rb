# frozen_string_literal: true
require_relative 'base_contract'

class UserContract < BaseContract
  params do
    required(:email).value(:string)
    required(:first_name).value(:string)
    required(:last_name).value(:string)
    required(:work).hash do
      required(:title).value(:string)
      optional(:department).value(:string)
    end
    optional(:age).maybe(:integer, gt?: 18)
  end

  rule(:first_name) do
    key.failure('must be more than 3 characters long') unless value.size >= 3
  end

  rule(:last_name) do
    key.failure('must be more than 3 characters long') unless value.size >= 3
  end
end
