class HeartbeatController < ApplicationController
  def index
    render json: { message: "♥" }
  end
end
