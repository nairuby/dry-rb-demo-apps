# frozen_string_literal: true

class HeartbeatController < ApplicationController
  def status
    render json: { status: 'ok' }
  end
end
