# frozen_string_literal: true

require 'spec_helper'
require_relative '../../contracts/user_contract.rb'


RSpec.describe UserContract do
  subject { UserContract.new }

  context 'Given there are no params' do
    let(:result) { subject.call({}) }

    specify 'Then the result is failure' do
      expect(result.success?).to eq(false)
    end

    specify 'Then errors are returned' do
      errors = result.errors.to_h
      expect(errors.size).not_to eq(0)
      expect(errors).to include(
        {
          :email  =>  ['is missing'],
          :first_name => ['is missing'],
          :last_name => ['is missing'],
          :work => ['is missing']
        }
      )
    end
  end

  context 'Given there are params' do
    let(:valid_params) do
      {
        email: 'kamauharrison87@gmail.com',
        first_name: 'Harrison',
        last_name: 'Kamau',
        work: {
          department: 'engineering',
          title: 'Software Engineer'
        }
      }
    end

    context 'When no email is provided' do
      let(:invalid_params) { valid_params.dup.tap { |p| p.delete(:email) } }
      let(:result) { subject.call(invalid_params) }

      specify 'Then the result is failure' do
        expect(result.success?).to eq(false)
      end

      specify 'Then an error is returned' do
        expect(result.errors.to_h.size).not_to eq(0)
      end

      specify 'Then the correct error message is returned' do
        expect(result.errors.to_h).to include(
          {
            :email => ['is missing']
          }
        )
      end
    end

    context 'When no first_name is provided ' do
      let(:invalid_params) { valid_params.dup.tap { |p| p.delete(:first_name) } }
      let(:result) { subject.call(invalid_params) }

      specify 'Then the result is failure' do
        expect(result.success?).to eq(false)
      end

      specify 'Then an error is returned' do
        expect(result.errors.to_h.size).not_to eq(0)
      end

      specify 'Then the correct error message is returned' do
        expect(result.errors.to_h).to include(
          {
            :first_name => ['is missing']
          }
        )
      end
    end

    context 'When no last_name is provided ' do
      let(:invalid_params) { valid_params.dup.tap { |p| p.delete(:last_name) } }
      let(:result) { subject.call(invalid_params) }

      specify 'Then the result is failure' do
        expect(result.success?).to eq(false)
      end

      specify 'Then an error is returned' do
        expect(result.errors.to_h.size).not_to eq(0)
      end

      specify 'Then the correct error message is returned' do
        expect(result.errors.to_h).to include(
          {
            :last_name => ['is missing']
          }
        )
      end
    end

    context 'When no work is provided ' do
      let(:invalid_params) { valid_params.dup.tap { |p| p.delete(:work) } }
      let(:result) { subject.call(invalid_params) }

      specify 'Then the result is failure' do
        expect(result.success?).to eq(false)
      end

      specify 'Then an error is returned' do
        expect(result.errors.to_h.size).not_to eq(0)
      end

      specify 'Then the correct error message is returned' do
        expect(result.errors.to_h).to include(
          {
            :work => ['is missing']
          }
        )
      end
    end

    context 'When wrong work type is provided' do
      let(:invalid_params) { valid_params.merge( { work: 'Software Engineer' }) }
      let(:result) { subject.call(invalid_params) }

      specify 'Then the result is failure' do
        expect(result.success?).to eq(false)
      end

      specify 'Then an error is returned' do
        error = result.errors.to_h
        expect(error.size).not_to eq(0)
        expect(error).to include(
          {
            work: ['must be a hash']
          }
        )
      end
    end

    context 'When all the params are correct' do
      let(:result) { subject.call(valid_params) }

      specify 'Then the result is success' do
        expect(result.success?).to eq(true)
      end

      specify 'Then no errors are returned' do
        expect(result.errors.to_h.size).to eq(0)
      end

      specify 'Then the right data is returned' do
        expect(result.to_h).to include(
          {
            first_name: valid_params[:first_name],
            last_name: valid_params[:last_name],
            email: valid_params[:email],
            work: valid_params[:work]
          }
        )
      end
    end
  end
end
