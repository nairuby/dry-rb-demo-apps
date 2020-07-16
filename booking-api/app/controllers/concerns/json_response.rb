# frozen_string_literal: true

module JsonResponse
  def success_response(object, status = :ok)
    render json: object, status: status
  end

  def error_response(object, status = :bad_request)
    render json: object, status: status
  end
end