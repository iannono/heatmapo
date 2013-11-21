class HeatsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

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
  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  end

  def cors_set_access_control_headers 
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  end

  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint, :screen_ratio)
  end 

end
