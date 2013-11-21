class HeatsController < ApplicationController

  def create
    site = Site.find(params[:site_id])
    @heat = site.heats.create(heat_params)
    render json: @heat
  end

  def index
    @heats = Heat.all
    @skewing_x = 1002
  end 

  private
  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint, :screen_ratio)
  end 

end
