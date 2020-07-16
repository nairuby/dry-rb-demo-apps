require_relative 'contracts/user_contract'
require 'dry/monads'

class User
  include Dry::Monads[:result]

  def call(params)
    validation = validate(params)
    return Success(validation.to_h) if validation.success?

    Failure(validation.errors.to_h)
  end

  private

  def validate(params)
    contract = UserContract.new
    results = contract.call(params)
    results
  end
end

new_user = {
  email: 'kamauharrison87@gmail.com',
  first_name: 'Harrison',
  last_name: 'Kamau',
  work: {
    department: 'engineering',
    title: 'Software Engineer'
  }
}


u = User.new
validated_user = u.call(new_user)
puts validated_user.value!
