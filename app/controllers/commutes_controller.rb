class CommutesController < ApplicationController
  def destroy
    commute = current_user.commutes.find(params[:id])
    commute.destroy

    redirect_to root_path, notice: "Commute deleted."
  end
end
