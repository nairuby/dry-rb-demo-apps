# frozen_string_literal: true

Rails.application.routes.draw do
  # Heartbeat
  get '/heartbeat', to: 'heartbeat#status'

   # API routes
   namespace 'api' do
    namespace 'v1' do
      resources :users do
        resources :bookings
      end
    end
  end

end
