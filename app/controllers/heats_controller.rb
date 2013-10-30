class HeatsController < ApplicationController
  include HeatHandler

  def create
    @heat = Heat.create(heat_params)
    render json: @heat
  end

  def index
    @heats = Heat.all
    @skewing_x = 1002
    generate_siteimg "http://www.baidu.com"
  end

  private
  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint)
  end

end
