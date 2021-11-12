class PlotPlantsController < ApplicationController
  def destroy
    @plot_plant = PlotPlant.find_by(plant_id: params[:id])
    PlotPlant.destroy(@plot_plant.id)
    redirect_to "/plots"

  end


end
