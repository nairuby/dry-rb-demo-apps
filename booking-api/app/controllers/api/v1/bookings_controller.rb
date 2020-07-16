# frozen_string_literal: true

module Api
  module V1
    class BookingsController < Api::V1::ApiController
      before_action :set_user

      def index
        @bookings = @user.bookings.all
        @serialized_bookings = []
        @bookings.each do |b|
          @serialized_bookings << serialize_booking(b)
        end

        render json: { bookings: @serialized_bookings }, status: :ok
      end

      def update
      end

      def destroy
      end

      def create
        @booking = @user.bookings.new(booking_params)
        if @booking.save
          render json: @booking, status: :created
        else
          render json: { errors: @booking.errors }, status: :bad_request
        end
      end

      private

      def booking_params
        params.permit(
          :start_date,
          :end_date,
          :user_id
        )
      end

      def set_user
        @user = User.find(params[:user_id])
      end

      def serialize_booking(booking)
        BookingSerializer.new(booking)
      end
    end
  end
end
