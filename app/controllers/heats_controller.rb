require 'net/http'
require 'uri'

class HeatsController < ApplicationController

  def create
    @heat = Heat.create(heat_params)
    render json: @heat
  end

  def index
    @heats = Heat.all
  end

  private
  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint)
  end
end
