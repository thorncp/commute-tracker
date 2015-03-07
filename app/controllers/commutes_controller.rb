class CommutesController < ApplicationController
  def index
    commutes = Commute.by_departed_at
    render json: commutes
  end

  def create
    commute = Commute.new(commute_params)

    if commute.save
      render json: commute, status: 201
    else
      render json: { errors: commute.errors.full_messages }, status: 422
    end
  end

  def update
    commute = Commute.find(params[:id])

    if commute.update_attributes(commute_params)
      render json: commute
    else
      render json: { errors: commute.errors.full_messages }, status: 422
    end
  end

  private

  def commute_params
    params.require(:commute).permit(:arrived_at, :departed_at)
  end
end
