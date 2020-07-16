# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :set_user, only: [:show, :destroy, :update]

      def index
        @users = User.all
        @serialized_users = []
        @users.each do |user|
          @serialized_users << serialize_user(user)
        end

        render json: { users: @serialized_users }, status: :ok
      end

      def show
        serialized_user = serialize_user(@user)
        success_response(serialized_user.to_json)
      end

      def destroy
        @user.destroy
        head :no_content
      end

      def update
        @user.update(user_params)
        success_response(@user)
      end

      def create
        @user = User.new(user_params)
        if @user.save
          serialized_user = serialize_user(@user)
          render json: serialized_user.to_json, status: :created
        else
          render json: { errors: @user.errors }, status: :bad_request
        end
      end

      private

      def user_params
        params.permit(
          :name,
          :age,
          :email
        )
      end

      def serialize_user(user)
        UserSerializer.new(user)
      end

      def set_user
        @user = User.find(user_id)
      end

      def user_id
        params[:id]
      end
    end
  end
end
