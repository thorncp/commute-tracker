class HeartbeatController < ApplicationController
  skip_before_action :require_login

  def index
    render json: { message: "♥" }
  end
end
