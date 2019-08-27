class MissionsController < ApplicationController
  # before_action :set_mission, only: [:show, :edit, :update]

  def new
    @mission = Mission.new
  end

  def create
  end

  private

  # def set_mission
  #   @mission = Mission.find(params[:id])
  # end

  def mission_params
    params.require(:mission).permit()
  end
end
