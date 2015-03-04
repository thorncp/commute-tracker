class HeartbeatController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: { message: "♥" }
  end
end
