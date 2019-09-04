class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  def new
    @simulation = Simulation.new
  end

  def create
    raise
    @simulation = Simulation.new(simulation_params)
    @simulation.activity = params["simulation"]["activity_ids"][1]
    @simulation.accre = params["simulation"]["accre_ids"][1]  == 'true' ? true : false
    @simulation.reglementary = params["simulation"]["reglementary_ids"][1]  == 'true' ? true : false
    @simulation.year_existence = params["simulation"]["year_ids"][1].to_i + 1
    @simulation.user = current_user
    @simulation.save
    render :show
  end

  def index
    @simulations = Simulation.all
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_simulation
    @simulation = Simulation.find(params[:id])
  end

  def simulation_params
    params.require(:simulation).permit(:activity, :reglementary, :accre, :year_existence, :result, :user_id)
  end
end
