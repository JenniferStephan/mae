class MissionsController < ApplicationController
  # before_action :set_mission, only: [:show, :edit, :update]

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    if @client.save
      redirect_to new_invoice_path
    else
      render :new
    end
  end

  private

  # def set_mission
  #   @mission = Mission.find(params[:id])
  # end

  def mission_params
    params.require(:mission).permit(:name)
  end
end
